Return-Path: <denys@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id D95CA52A68
	for <meta-arago@arago-project.org>;
	Fri, 22 Sep 2017 18:53:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8MIr7oM021340
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 13:53:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506106387;
	bh=xpTo/XIggZaR2yeLAlIZwRKxkFpO8MYTnxepVo12WBA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=C+nhCIskRJ9jdI0jVVy4uB9APcMHZfjPK6hdctpy4STBzqPwPuRjSpNHXcXyxRWWj
	0GgmtOevKeS2ySOfbb/sn2TP8a1q7G5ut8x6llKRCMGf/4WSUk5DMvmxxNr67SYATI
	mVmKGfaCsai28RVuf7d1SG7Pf5CSOowRngXchkMg=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MIr7BC026222
	for <meta-arago@arago-project.org>; Fri, 22 Sep 2017 13:53:07 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 22 Sep 2017 13:53:06 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 22 Sep 2017 13:53:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8MIr6IJ015086;
	Fri, 22 Sep 2017 13:53:06 -0500
Date: Fri, 22 Sep 2017 14:52:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jean-Jacques Hiblot <jjhiblot@ti.com>
Message-ID: <20170922185251.GS26843@edge>
References: <1506000653-15572-1-git-send-email-jjhiblot@ti.com>
	<20170921191841.GH26843@edge>
	<6ca9bce3-53fa-baa8-bdca-1b98269e606f@ti.com>
MIME-Version: 1.0
In-Reply-To: <6ca9bce3-53fa-baa8-bdca-1b98269e606f@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [morty] linux-libc-headers (4.4 kernel): update to include dma-buf.h export fix
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
X-List-Received-Date: Fri, 22 Sep 2017 18:53:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 22, 2017 at 09:08:48AM +0200, Jean-Jacques Hiblot wrote:
> Denys,
> 
> 
> On 21/09/2017 21:18, Denys Dmytriyenko wrote:
> >JJ,
> >
> >Thanks. Do you need this in morty or krogoth? I believe this is specific to
> >krogoth, as morty already has this fix. I can merge to krogoth, if you agree.
> Yes. That would be good.

Thanks, merged into krogoth.


> >On Thu, Sep 21, 2017 at 03:30:53PM +0200, Jean-Jacques Hiblot wrote:
> >>Signed-off-by: Jean-Jacques Hiblot <jjhiblot@ti.com>
> >>---
> >>  .../recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend | 4 ++--
> >>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >>diff --git a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
> >>index 7d0537d..c1d8fd1 100644
> >>--- a/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
> >>+++ b/meta-arago-distro/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bbappend
> >>@@ -1,7 +1,7 @@
> >>-PR_append = ".arago0"
> >>+PR_append = ".arago1"
> >>  BRANCH = "ti-lsk-linux-4.4.y"
> >>-SRCREV = "6580f85400b48d55d06f11d6b75c056399123a72"
> >>+SRCREV = "2612ef5805db717f9818f06786e863d3b1a7f87e"
> >>  KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
> >>  KERNEL_GIT_PROTOCOL = "git"
> >>-- 
> >>1.9.1
> >>
> 

