Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTPS id 44DC552A4F
	for <meta-arago@arago-project.org>;
	Fri, 24 Jul 2015 17:56:17 +0000 (UTC)
Received: from gandalf.denix.org ([108.51.169.48]) by vms173021.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul
	16 2014))
	with ESMTPSA id <0NS000K1W75DG0E0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 24 Jul 2015 12:56:07 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WpDWSorv c=1 sm=1 tr=0	a=x3PDphkivVtATbYodTxRAw==:117
	a=sozttTNsAAAA:8 a=0gcC27t9AAAA:8	a=oR5dmqMzAAAA:8 a=XYJHFtupD_QA:10
	a=-9mUelKeXuEA:10 a=kj9zAlcOel0A:10	a=zOBTXjUuO1YA:10 a=HihYlcsHAAAA:8
	a=w6itKzYy1291-SD3rkQA:9	a=CjuIK1q_8ugA:10
Received: by gandalf.denix.org (Postfix, from userid 1000)	id D6CBE161B16; Fri,
	24 Jul 2015 13:56:01 -0400 (EDT)
Date: Fri, 24 Jul 2015 13:56:01 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-id: <20150724175601.GG1089@denix.org>
References: <1422426701-26910-1-git-send-email-nikhil.nd@ti.com>
	<E60A9E1B4132A24DB80BD56ABC92684735043FCF@DBDE04.ent.ti.com>
	<54C90AFB.9050302@ti.com>
MIME-version: 1.0
In-reply-to: <54C90AFB.9050302@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "R,
	Karthik" <karthik.ramanan@ti.com>
Subject: Re: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests packages
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
X-List-Received-Date: Fri, 24 Jul 2015 17:56:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

Karthik, Nikhil,

This split was done back in January, but now it causes a conflict, because 
both vpdma-fw and vpe-tests try to install the same firmware image. Do you 
know if vpe-tests Makefile needs to be updated to not install FW image, or we 
can do it in the recipe itself. How do you want to handle this?

-- 
Denys


On Wed, Jan 28, 2015 at 09:44:51PM +0530, Karthik Ramanan wrote:
> ACK.
> 
> Validated on dra7xx-evm.
> 
> Regards
> Karthik
> 
> On 28-Jan-15 12:04 PM, Devshatwar, Nikhil wrote:
> >Hi,
> >The patch http://dflvsu0004.dal.design.ti.com/patch/12353/ in meta-ti
> >Splits the vpdma-fw and vpe-tests recipes
> >This patch is needed to update the package group in meta-arago correspondingly
> >
> >
> >>-----Original Message-----
> >>From: Devshatwar, Nikhil
> >>Sent: Wednesday, January 28, 2015 12:02 PM
> >>To: meta-arago@arago-project.org
> >>Cc: R, Karthik; Devshatwar, Nikhil
> >>Subject: [PATCH] packagegroup-arago-test: Update vpdma-fw and vpe-tests
> >>packages
> >>
> >>The vpdma-fw and vpe-tests are independent packages now.
> >>Adding them both in the packagegroup.
> >>
> >>Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >>---
> >>  .../packagegroups/packagegroup-arago-test.bb       |    3 ++-
> >>  1 file changed, 2 insertions(+), 1 deletion(-)
> >>
> >>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> >>arago-test.bb b/meta-arago-distro/recipes-
> >>core/packagegroups/packagegroup-arago-test.bb
> >>index 6af1321..83ba20e 100644
> >>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> >>test.bb
> >>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-
> >>test.bb
> >>@@ -44,7 +44,8 @@ ARAGO_TI_TEST_append_omap-a15 = " \
> >>      "
> >>
> >>  ARAGO_TI_TEST_append_dra7xx = " \
> >>-    vpe-vpdma \
> >>+    vpdma-fw \
> >>+    vpe-tests \
> >>      "
> >>
> >>  RDEPENDS_${PN} = "\
> >>--
> >>1.7.9.5
> >
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

