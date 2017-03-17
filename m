Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id AA20652A19
	for <meta-arago@arago-project.org>;
	Fri, 17 Mar 2017 18:51:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2HIpMhb014990
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 13:51:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489776682;
	bh=TCZW9eX5wMRI8mJJAvivBie+slDiVDAi6bqceH5NkqQ=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=hRXvuyNRh1vZBjXcOkTQt77xZkSty2SxNC73Nf2D1U/hXC8kRDOFqQVKGy1u4yCEO
	ypD3mPl1ucwLDJdy1Eg1H9NndPSuAqckx/139Ob2RMg5saqH7EYcMgnqT1Nh/7lYXN
	pYbuG6c6blkUIZ5r0ion0mUTuR8xA2bmmsqKb+Rc=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HIpMjO029093
	for <meta-arago@arago-project.org>; Fri, 17 Mar 2017 13:51:22 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 17 Mar 2017 13:51:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2HIpMpP012486;
	Fri, 17 Mar 2017 13:51:22 -0500
Date: Fri, 17 Mar 2017 14:51:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20170317185120.GB14484@edge>
References: <1489600884-27644-1-git-send-email-j-stiffler@ti.com>
	<20170316192033.GP14484@edge> <20170316192359.GQ14484@edge>
	<20170316202805.GT14484@edge>
	<281d4261-9aba-1257-d0e9-dec0b8f53d81@ti.com>
	<77986226-486b-b9eb-5ae2-2455688245df@ti.com>
MIME-Version: 1.0
In-Reply-To: <77986226-486b-b9eb-5ae2-2455688245df@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
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
X-List-Received-Date: Fri, 17 Mar 2017 18:51:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Mar 17, 2017 at 10:46:35AM -0400, Jacob Stiffler wrote:
> 
> 
> On 3/17/2017 9:38 AM, Jacob Stiffler wrote:
> >
> >
> >On 3/16/2017 4:28 PM, Denys Dmytriyenko wrote:
> >>On Thu, Mar 16, 2017 at 03:23:59PM -0400, Denys Dmytriyenko wrote:
> >>>On Thu, Mar 16, 2017 at 03:20:33PM -0400, Denys Dmytriyenko wrote:
> >>>>Jake,
> >>>>
> >>>>It appears the new version no longer provides libOpenCL.so -
> >>>>is it expected?
> >>>Actually, it does provide it, just messing up the debian
> >>>package renaming due
> >>>to all the new stuff... I'll see if I can correct it.
> >>It's not just few packagegroups, it's everything that depends on opencl
> >>(opencv, openmp, examples, etc.) is affected. If you build from
> >>scratch every
> >>time, you won't see it.
> >>
> >>I've submitted a patch to hopefully resolve it:
> >>http://arago-project.org/pipermail/meta-arago/2017-March/008854.html
> >>
> >>This doesn't only affect incremental builds, but also package
> >>feeds and would
> >>break package/distro upgrades in the field. Unfortunately, we
> >>haven't been
> >>paying much attention to this problem in the past, but as we've already
> >>discussed, we should keep an eye on it...
> >>
> >I'm trying to understand this automatic package naming, and how
> >the opencl package gets renamed to libopencl when the IPK is
> >created. Could you point to where this occurs in OE?
> 
> Reading the comment on your patch shows why this happens, and I have
> found that the code responsible is in the debian.bbclass.
> 
> >I also see that on krogoth, everything is OK. Even with the new
> >binaries, the IPKs are still name libopencl*. However, I do see
> >that on morty, the addition of the binaries does alter the IPK
> >names.
> 
> I see the it was OK because your patch was already committed.
> Removing that patch shows the problem.

Sorry, couldn't wait any longer - had to make 2016.06.01 RC build last 
night...


> >I'll look at the patch and provide comments once I better
> >understand what is happening.
> 
> We may need to take a closer look at the packaging and dependencies.
> I would assume that the library RDEPENDS on the daemon, so it might
> not make sense to have opposite dependency in the packages (runtime
> RDEPENDS on libraries).

First of all, I noticed that ${PN}-runtime wasn't even used - it had no 
FILES_${PN}-runtime defined, thus not packaging any files. What was it's 
intentional purpose?
If needed, we can change the way files get packaged and dependencies between 
them.

Second, it's unfortunate that this package renaming slipped through unnoticed 
in the very beginning for opencl - not sure if it was meant to be just a 
library or not. If the main purpose of opencl package is indeed to provide 
libOpenCL.so library, then it's fine for the package to stay as libopencl1*. 
Otherwise we could have disabled automatic debian renaming for it...

-- 
Denys

