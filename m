Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 54DC25297F
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2015 17:10:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t44HADgY016184;
	Mon, 4 May 2015 12:10:13 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t44HACaP014867;
	Mon, 4 May 2015 12:10:12 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 May 2015 12:10:11 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t44HABBl013160;
	Mon, 4 May 2015 12:10:11 -0500
Message-ID: <5547A7F3.6080000@ti.com>
Date: Mon, 4 May 2015 13:10:11 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>, Denys Dmytriyenko <denis@denix.org>
References: <1430509560-4046-1-git-send-email-denis@denix.org>
	<20150504164319.GD8462@edge>
In-Reply-To: <20150504164319.GD8462@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH] gstreamer1.0-plugins-bad: only enable wayland flag conditionally on dra7xx
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
X-List-Received-Date: Mon, 04 May 2015 17:10:14 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

ACK.

I do not foresee any issues with this.

On 5/4/2015 12:43 PM, Denys Dmytriyenko wrote:
> Jake,
>
> Do you see any issues or have any comments with this?
>
>
> On Fri, May 01, 2015 at 03:46:00PM -0400, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>   .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>> index d49da02..f2a38df 100644
>> --- a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>> +++ b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>> @@ -1,6 +1,8 @@
>>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>   
>> -PACKAGECONFIG = "faad ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
>> +PACKAGECONFIG = "faad"
>> +
>> +PACKAGECONFIG_append_dra7xx = " ${@base_contains('DISTRO_FEATURES','wayland','wayland','',d)}"
>>   
>>   DEPENDS_append_dra7xx = " \
>>       libdce \
>> @@ -16,4 +18,4 @@ SRC_URI_append = " \
>>           file://0006-GstDRMBufferPool-support-fix.patch \
>>   "
>>   
>> -PR_append = "-arago1"
>> +PR_append = "-arago2"
>> -- 
>> 1.7.9.5
>>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


