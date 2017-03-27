Return-Path: <denys@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 9D5F0520C1
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 13:47:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RDllPE030372
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490622467;
	bh=npVmY55pKowP5P3wDCCeA4cWL3jZgCjTmMAtCI5o9bE=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=VvDRwJUego11Cj0MUrGOY4zkJystYaioig/Z0/5nqyn0GisrDHkYXXO4ohprM9Q7q
	2Xd7nmZUY8v2P4WJcnVNq9lKKjIWdUB3THp/Q8Q/Kk/XIyhwFjot5q/uw/cu//NNri
	4lo7WsC5+jKQLJHUkIbCxM1r+Dtiqp4BNMX67u9o=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDlgo6020714
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:47:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 08:47:41 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDlfSc030294;
	Mon, 27 Mar 2017 08:47:41 -0500
Date: Mon, 27 Mar 2017 09:47:41 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20170327134741.GR29187@edge>
References: <1488297560-24159-1-git-send-email-j-stiffler@ti.com>
	<4c5c42df-4829-4751-01fc-cb89141e7df9@ti.com>
MIME-Version: 1.0
In-Reply-To: <4c5c42df-4829-4751-01fc-cb89141e7df9@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [krogoth/morty/master][PATCH 1/2] packagegroup-arago-tisdk-opencl*: add linalg for dra7xx
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
X-List-Received-Date: Mon, 27 Mar 2017 13:47:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Not sure how I missed that - thanks for cacthing it. Fixed now.


On Mon, Mar 27, 2017 at 08:22:48AM -0400, Jacob Stiffler wrote:
> Denys,
> 
> 
> I see that this got applied to master/morty, but not to krogoth. Can
> you please also apply this to the krogoth branch?
> 
> 
> Thank you,
> 
> Jake
> 
> 
> On 2/28/2017 10:59 AM, Jacob Stiffler wrote:
> >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >---
> >  .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb       | 6 +++++-
> >  .../packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb     | 6 +++++-
> >  .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb   | 6 +++++-
> >  3 files changed, 15 insertions(+), 3 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
> >index aac2472..0e0e112 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-host.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install sources for OpenCL/MP apps and demos"
> >  LICENSE = "MIT"
> >-PR = "r0"
> >+PR = "r1"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >@@ -15,6 +15,10 @@ UTILS_append_k2hk-evm = " \
> >      linalg-examples-src \
> >  "
> >+UTILS_append_dra7xx = " \
> >+    linalg-examples-src \
> >+"
> >+
> >  RDEPENDS_${PN} = "\
> >      ${UTILS} \
> >  "
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
> >index ac235f0..ea0f724 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl-sdk-target.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install headers and libraries of OpenCL/MP and related components"
> >  LICENSE = "MIT"
> >-PR = "r1"
> >+PR = "r2"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >@@ -16,6 +16,10 @@ UTILS_append_k2hk-evm = " \
> >      linalg-dev \
> >  "
> >+UTILS_append_dra7xx = " \
> >+    linalg-dev \
> >+"
> >+
> >  RDEPENDS_${PN} = "\
> >      ${UTILS} \
> >  "
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> >index 6898dd6..e882e2a 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
> >@@ -1,6 +1,6 @@
> >  DESCRIPTION = "Task to install OpenCL/MP and related components"
> >  LICENSE = "MIT"
> >-PR = "r1"
> >+PR = "r2"
> >  PACKAGE_ARCH = "${MACHINE_ARCH}"
> >@@ -23,6 +23,10 @@ EXTRA_PKGS_append_k2hk-evm = " \
> >      linalg-examples \
> >  "
> >+EXTRA_PKGS_append_dra7xx = " \
> >+    linalg-examples \
> >+"
> >+
> >  RDEPENDS_${PN} = "\
> >      ${MAIN_PKGS} \
> >  "
> 

