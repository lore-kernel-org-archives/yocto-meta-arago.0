Return-Path: <j-stiffler@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 9A37C52A1C
	for <meta-arago@arago-project.org>;
	Thu,  4 Feb 2016 17:53:45 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u14Hrjuj022696
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 11:53:45 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14HrjOW007241
	for <meta-arago@arago-project.org>; Thu, 4 Feb 2016 11:53:45 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 4 Feb 2016 11:53:44 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u14Hridr012846;
	Thu, 4 Feb 2016 11:53:44 -0600
Message-ID: <56B39029.5040001@ti.com>
Date: Thu, 4 Feb 2016 12:53:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1454594668-2894-1-git-send-email-j-stiffler@ti.com>
	<20160204172753.GI31480@edge> <56B38B98.2020906@ti.com>
	<20160204174606.GJ31480@edge>
In-Reply-To: <20160204174606.GJ31480@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH 1/3] packagegroup-arago-tisdk-addons: Add debug tools such as gdb
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
X-List-Received-Date: Thu, 04 Feb 2016 17:53:45 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 2/4/2016 12:46 PM, Denys Dmytriyenko wrote:
> On Thu, Feb 04, 2016 at 12:34:16PM -0500, Jacob Stiffler wrote:
>> Can you point to where this is? I do not see any in the meta-arago
>> packagegroups, and it has been missing from our filesystem.
> images/tisdk-server-rootfs-image.bb
> packagegroups/packagegroup-arago-test-addons.bb

I'll submit a v2 with removing gdb from these locations.

> Surprisingly, server-rootfs-image is the only consumer of the test-addons
> packagegroup... And adding gdb directly to a server image was a temp hack 3+
> years ago - "nothing is more permanent than the temporary", eh? :)
>
>
>> On 2/4/2016 12:27 PM, Denys Dmytriyenko wrote:
>>> I think there are already couple places where gdb is added directly. Can we
>>> clean those up as well?
>>>


