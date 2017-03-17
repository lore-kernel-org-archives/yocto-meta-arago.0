Return-Path: <j-stiffler@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 9A94A529A0
	for <meta-arago@arago-project.org>;
	Fri, 17 Mar 2017 13:38:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2HDclVZ021120
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 08:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489757927;
	bh=wKxwIMgt8jxh+82NH2Bqz5dpzv7uUb1nndIUmL0z14g=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=YH5WQwO4hoTXjfYW/K6ErGqbiW3GPvP1X1tvX29+X/cn7Xm0I0JQ4PiIpalaB6zA5
	x2im2Jevf8IByEuim9sEQDei6BF3Mw0yHPJH+rGOWBCnGi/Mnz6Cl8ZIbQPdOjS/hw
	ypa39jWvBnbFo7EM+/qoMlFaPzk1KTR2a7eITUUo=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HDclLt030450
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 08:38:47 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Mar 2017 08:38:46 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HDckjj027138;
	Fri, 17 Mar 2017 08:38:46 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1489600884-27644-1-git-send-email-j-stiffler@ti.com>
	<20170316192033.GP14484@edge> <20170316192359.GQ14484@edge>
	<20170316202805.GT14484@edge>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <281d4261-9aba-1257-d0e9-dec0b8f53d81@ti.com>
Date: Fri, 17 Mar 2017 09:38:46 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20170316202805.GT14484@edge>
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 1/2] ocl: update to version 1.1.12.0
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
X-List-Received-Date: Fri, 17 Mar 2017 13:38:47 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 3/16/2017 4:28 PM, Denys Dmytriyenko wrote:
> On Thu, Mar 16, 2017 at 03:23:59PM -0400, Denys Dmytriyenko wrote:
>> On Thu, Mar 16, 2017 at 03:20:33PM -0400, Denys Dmytriyenko wrote:
>>> Jake,
>>>
>>> It appears the new version no longer provides libOpenCL.so - is it expected?
>> Actually, it does provide it, just messing up the debian package renaming due
>> to all the new stuff... I'll see if I can correct it.
> It's not just few packagegroups, it's everything that depends on opencl
> (opencv, openmp, examples, etc.) is affected. If you build from scratch every
> time, you won't see it.
>
> I've submitted a patch to hopefully resolve it:
> http://arago-project.org/pipermail/meta-arago/2017-March/008854.html
>
> This doesn't only affect incremental builds, but also package feeds and would
> break package/distro upgrades in the field. Unfortunately, we haven't been
> paying much attention to this problem in the past, but as we've already
> discussed, we should keep an eye on it...
>
I'm trying to understand this automatic package naming, and how the 
opencl package gets renamed to libopencl when the IPK is created. Could 
you point to where this occurs in OE?

I also see that on krogoth, everything is OK. Even with the new 
binaries, the IPKs are still name libopencl*. However, I do see that on 
morty, the addition of the binaries does alter the IPK names.

I'll look at the patch and provide comments once I better understand 
what is happening.

- Jake

