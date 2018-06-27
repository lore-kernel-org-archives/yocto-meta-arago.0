Return-Path: <denys@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id AD475529CE
	for <meta-arago@arago-project.org>;
	Wed, 27 Jun 2018 16:21:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w5RGLKM0101755
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 11:21:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1530116480;
	bh=8lq3/7LrhCvTXOYFEVUhvNQP+2s2W25W2LBk9o0NvLk=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=CXPU61+I68w695KT5Fg5Ww8Ud++yR0GxnVqK0rqK16NdFeMuDX1PWOjpiX3eqbyVP
	omd7WD1mJvxGtmLHXxKo1zsFF2YP9taU36vNM6KINoB26GO5Yzb4AgU9XaeMvJftEI
	V/4kvA1u3Fq61DWT0v7q1VB3YKCEOYUY6i7I5/9A=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RGLKb8018750
	for <meta-arago@arago-project.org>; Wed, 27 Jun 2018 11:21:20 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 27 Jun 2018 11:21:19 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 27 Jun 2018 11:21:19 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5RGLJ5d009489;
	Wed, 27 Jun 2018 11:21:19 -0500
Date: Wed, 27 Jun 2018 12:20:23 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20180627162023.GB3163@beryl>
References: <1530087529-102302-1-git-send-email-a0393906@ti.com>
	<1530087529-102302-2-git-send-email-a0393906@ti.com>
	<20180627155441.GZ3163@beryl>
	<70d4530f-dde9-5068-e857-1f1b756e7d67@ti.com>
MIME-Version: 1.0
In-Reply-To: <70d4530f-dde9-5068-e857-1f1b756e7d67@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko 2/3] wayland-ivi-extension: Update to version 2.1.0
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
X-List-Received-Date: Wed, 27 Jun 2018 16:21:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 27, 2018 at 09:50:22PM +0530, Karthik Ramanan wrote:
> 
> 
> On 27-Jun-18 9:24 PM, Denys Dmytriyenko wrote:
> >On Wed, Jun 27, 2018 at 01:48:48PM +0530, Karthik Ramanan wrote:
> >>This version is compatible with weston 2.0.0
> >>
> >>Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> >>---
> >>  ...yland-ivi-extension_1.11.0.bb => wayland-ivi-extension_2.1.0.bb} | 6 ++----
> >>  1 file changed, 2 insertions(+), 4 deletions(-)
> >>  rename meta-arago-distro/recipes-graphics/wayland/{wayland-ivi-extension_1.11.0.bb => wayland-ivi-extension_2.1.0.bb} (80%)
> >>
> >>diff --git a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
> >>similarity index 80%
> >>rename from meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
> >>rename to meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
> >>index 75e284f..894d1b8 100644
> >>--- a/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_1.11.0.bb
> >>+++ b/meta-arago-distro/recipes-graphics/wayland/wayland-ivi-extension_2.1.0.bb
> >>@@ -5,12 +5,10 @@ BUGTRACKER = "http://bugs.genivi.org/enter_bug.cgi?product=Wayland%20IVI%20Exten
> >>  LICENSE = "Apache-2.0"
> >>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1f1a56bb2dadf5f2be8eb342acf4ed79"
> >>-SRCREV = "c9001582b10ce209c37b42dd560947c5aa8928b3"
> >>+SRCREV = "d2c2e262f3bdc9db33b3014293fcdbcfdc90ab27"
> >>  SRC_URI = "git://github.com/GENIVI/${BPN}.git;protocol=http \
> >>             file://force-type-conversion.patch \
> >>-           file://0001-layer-add-surfaces-Add-screenId-as-an-argument.patch \
> >>-           file://0002-layer-add-surfaces-surface-layer-management.patch \
> >Now that this is a diff, it clearly reveals that these 2 patches are no
> >longer used - do you want to remove them?
> This was intentionally left behind. So lets not remove it at the moment.
> These two patches were additions by TI to the wayland-ivi-extension. I still
> need more time to determine how and in what form these changes have made its
> way into the upstream.
> Lets keep it for now and I am looking into reworking/removing them from here
> soon.

Ok, thanks.


> >>      "
> >>  S = "${WORKDIR}/git"
> >>@@ -26,7 +24,7 @@ FILES_${PN}-dbg += "${libdir}/weston/.debug/*"
> >>  EXTRA_OECMAKE += "-DLIB_SUFFIX=${@d.getVar('baselib', True).replace('lib', '')}"
> >>-PR = "r3"
> >>+PR = "r1"
> >>  # Need these temporarily to prevent a non-fatal do_package_qa issue
> >>  INSANE_SKIP_${PN} += "dev-deps"
> >>-- 
> >>1.9.1
> >>
> >>_______________________________________________
> >>meta-arago mailing list
> >>meta-arago@arago-project.org
> >>http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> 

