Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id C171352007
	for <meta-arago@arago-project.org>;
	Fri, 16 Sep 2016 16:22:23 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8GGMMbl003071
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 11:22:22 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8GGMMqg021410
	for <meta-arago@arago-project.org>; Fri, 16 Sep 2016 11:22:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 16 Sep 2016 11:22:21 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8GGMLHA030369;
	Fri, 16 Sep 2016 11:22:21 -0500
Date: Fri, 16 Sep 2016 12:22:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160916162221.GX29658@edge>
References: <1473964509-21429-1-git-send-email-j-stiffler@ti.com>
	<1473964509-21429-2-git-send-email-j-stiffler@ti.com>
	<20160915192917.GU29658@edge>
	<4B26FB5A64EBA14C87266869E037F958142FE688@DFLE09.ent.ti.com>
	<20160916161340.GW29658@edge>
	<20fa2d84-19d8-f051-4404-6d539700e26a@ti.com>
MIME-Version: 1.0
In-Reply-To: <20fa2d84-19d8-f051-4404-6d539700e26a@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 2/3] oc: bump SRCREV to version 1.1.10.0
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
X-List-Received-Date: Fri, 16 Sep 2016 16:22:24 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Sep 16, 2016 at 12:21:13PM -0400, Jacob Stiffler wrote:
> 
> 
> On 9/16/2016 12:13 PM, Denys Dmytriyenko wrote:
> >On Fri, Sep 16, 2016 at 05:54:34AM -0400, Stiffler, Jacob wrote:
> >>>-----Original Message-----
> >>>From: Dmytriyenko, Denys
> >>>Sent: Thursday, September 15, 2016 3:29 PM
> >>>To: Stiffler, Jacob
> >>>Cc: meta-arago@arago-project.org
> >>>Subject: Re: [meta-arago] [PATCH 2/3] oc: bump SRCREV to version 1.1.10.0
> >>>
> >>>>oc: bump SRCREV to version 1.1.10.0
> >>>Should it be ocl in the subject?
> >>>
> >>Yes. And I just found out a 1.1.10.1 version is happening. I'll resubmit
> >>with the new SRCREV and fix the comit message.
> >Will you be resubmitting all 3 patches or only #2?
> 
> Only #2.

Sorry, I meant to ask if I should push #1 and #3 now w/o #2 or should I wait 
for you to resubmit #2 and keep the order?


> >>>On Thu, Sep 15, 2016 at 02:35:08PM -0400, Jacob Stiffler wrote:
> >>>>Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >>>>---
> >>>>  meta-arago-extras/recipes-ti/ocl/ocl.inc | 4 ++--
> >>>>  1 file changed, 2 insertions(+), 2 deletions(-)
> >>>>
> >>>>diff --git a/meta-arago-extras/recipes-ti/ocl/ocl.inc b/meta-arago-
> >>>extras/recipes-ti/ocl/ocl.inc
> >>>>index 4df0c9e..1937a3f 100644
> >>>>--- a/meta-arago-extras/recipes-ti/ocl/ocl.inc
> >>>>+++ b/meta-arago-extras/recipes-ti/ocl/ocl.inc
> >>>>@@ -1,4 +1,4 @@
> >>>>-PV = "1.1.9.1"
> >>>>+PV = "1.1.10.0"
> >>>>  INC_PR = "r0"
> >>>>
> >>>>  LIC_FILES_CHKSUM =
> >>>"file://../debian/copyright;md5=2e3965a73a8a49c23836467266120dff"
> >>>>@@ -9,7 +9,7 @@ OCL_GIT_URI = "git://git.ti.com/opencl/ti-opencl.git"
> >>>>  OCL_GIT_PROTOCOL = "git"
> >>>>  OCL_GIT_BRANCH = "master"
> >>>>
> >>>>-OCL_SRCREV = "aa89b7359d6328e98fa80c55c3b73543c53a1bbc"
> >>>>+OCL_SRCREV = "b2b6c17a40bc79f49b6cdc44b6a42faeb56a6d2f"
> >>>>
> >>>>  BRANCH = "${OCL_GIT_BRANCH}"
> >>>>  SRC_URI =
> >>>"${OCL_GIT_URI};protocol=${OCL_GIT_PROTOCOL};branch=${BRANCH}"
> >>>>--
> >>>>2.7.4
> >>>>
> >>>>_______________________________________________
> >>>>meta-arago mailing list
> >>>>meta-arago@arago-project.org
> >>>>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

