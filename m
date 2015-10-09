Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1351952A58
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 11:37:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99BbZiW021550;
	Fri, 9 Oct 2015 06:37:36 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99BbZJU009321;
	Fri, 9 Oct 2015 06:37:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 06:37:35 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99BbZpa005453;
	Fri, 9 Oct 2015 06:37:35 -0500
Message-ID: <5617A6FF.1090401@ti.com>
Date: Fri, 9 Oct 2015 07:37:35 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <1444390383-5586-1-git-send-email-j-stiffler@ti.com>
	<20151009113618.GE11709@denix.org>
In-Reply-To: <20151009113618.GE11709@denix.org>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] init-ifupdown: Fix getting DNS if rootfs is network mount
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 09 Oct 2015 11:37:37 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/9/2015 7:36 AM, Denys Dmytriyenko wrote:
> NAK, this is wrong.

What is wrong about it? Is there another way to get the DNS addresses?

> On Fri, Oct 09, 2015 at 07:33:03AM -0400, Jacob Stiffler wrote:
>> * Previously, if the rootfs was a network mount, then no network
>>    configuration was done
>> * This included the DHCP request to obtain the DNS addresses
>> * If the rootfs is a network mount, then run "udhcpc" to get the DNS
>>    addresses
>>
>> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
>> ---
>>   meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init      | 5 ++++-
>>   .../recipes-core/init-ifupdown/init-ifupdown_%.bbappend              | 2 +-
>>   2 files changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
>> index 86aff88..235652d 100644
>> --- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
>> +++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown/init
>> @@ -20,12 +20,15 @@ case "$1" in
>>           if sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |
>>             grep -q "^/ nfs$"; then
>>               echo "NOT configuring network interfaces: / is an NFS mount"
>> +            udhcpc
>>           elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\1 \2/p' /proc/mounts |
>>             grep -q "^/ smbfs$"; then
>>               echo "NOT configuring network interfaces: / is an SMB mount"
>> -	elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts |
>> +            udhcpc
>> +        elif sed -n 's/^[^ ]* \([^ ]*\) \([^ ]*\) .*$/\2/p' /proc/mounts |
>>             grep -qE '^(nfs|smbfs|ncp|coda)$'; then
>>               echo "NOT configuring network interfaces: network shares still mounted."
>> +            udhcpc
>>           else
>>               echo -n "Configuring network interfaces... "
>>               ifup -a
>> diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
>> index c0ab069..997adf2 100644
>> --- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
>> +++ b/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_%.bbappend
>> @@ -1,4 +1,4 @@
>>   # look for files in this layer first
>>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>   
>> -PR_append = "-arago0"
>> +PR_append = "-arago1"
>> -- 
>> 1.9.1
>>
>> _______________________________________________
>> meta-arago mailing list
>> meta-arago@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>


