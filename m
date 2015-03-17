Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 9C1F152099
	for <meta-arago@arago-project.org>;
	Tue, 17 Mar 2015 19:19:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2HJJ8X6016278
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:19:08 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HJJ7lp032466
	for <meta-arago@arago-project.org>; Tue, 17 Mar 2015 14:19:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 17 Mar 2015 14:19:07 -0500
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2HJJ7pi015376;
	Tue, 17 Mar 2015 14:19:07 -0500
Message-ID: <55087E2B.108@ti.com>
Date: Tue, 17 Mar 2015 15:19:07 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Cooper Jr., Franklin" <fcooper@ti.com>, "Dmytriyenko, Denys"
	<denys@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <1426546322-25230-1-git-send-email-denis@denix.org>	<1426546322-25230-8-git-send-email-denis@denix.org>	<20150317184845.GA9813@edge>
	<8F29D6B095ED194EA1980491A5E029710C84948A@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C84948A@DFLE08.ent.ti.com>
Subject: Re: [PATCH 7/7][RFC] packagegroup-*-tisdk-addons: enable compiler and build essentials on omap-a15
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
X-List-Received-Date: Tue, 17 Mar 2015 19:19:09 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/17/2015 03:03 PM, Cooper Jr., Franklin wrote:
>> I marked this as RFC to solicit feedback. As explained in the 0/7 cover letter
>> >for the series, there are several methods to pull in gcc and build tools to the
>> >rootfs. This patch uses the least invasive one and enables minimal set of dev
>> >tools and only for omap-a15 SOC platforms (need to repeat it for keystone
>> >SOC). That covers Cortex-A15, but I know in the future we'd need target gcc
>> >also on am3/4 platforms - would you have any preferences to enable this?
> [Franklin] My understanding was the only reason this was needed is to enable developers to be able to compile
> dsp code and opencl code on the target for some reason especially since those are very powerful processors with a lot of memory.
>
> Unless something change this wasn't something we cared to enabled on 335x and 437x. No big deal doing it as long as the file system is bloated but I have no idea who really was going to use this/test this for those platforms.

Some Linaro tests does use make in the target. e.g. 
https://git.linaro.org/?p=tools/pm-qa.git;a=summary



