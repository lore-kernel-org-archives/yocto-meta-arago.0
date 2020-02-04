Return-Path: <denys@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 56494529A5
	for <meta-arago@arago-project.org>;
	Tue,  4 Feb 2020 20:28:38 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 014KQiiL103329;
	Tue, 4 Feb 2020 14:26:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1580848004;
	bh=gnhjqb3ezRwpZ5jfiBjMDD2L+9oPasro/9V/OL3FBtY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=RLN9gRZuXk3g4z0N3VaHCb5bs2JQIzIJuj3YMppix00ZnypHdn8Uy3NdLXpBBWjnf
	I+0V4SUXsP4sa2rOAWvj653XE31F1ADr5eVdefyj16IO0Gm6aN22rBvBfumH2Gwi/Y
	y4u2S8BREJgj4GW9FaA7SprqnM3lIvgaEZzHZm3U=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 014KQieG052502
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 4 Feb 2020 14:26:44 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Tue, 4 Feb 2020 14:26:44 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Tue, 4 Feb 2020 14:26:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 014KQhZ4015217;
	Tue, 4 Feb 2020 14:26:44 -0600
Date: Tue, 4 Feb 2020 15:26:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20200204202643.GB4415@beryl>
References: <1580840296-30685-1-git-send-email-denis@denix.org>
	<1580840296-30685-2-git-send-email-denis@denix.org>
	<ffee611a-04fa-5019-9786-7c16cae71e87@ti.com>
MIME-Version: 1.0
In-Reply-To: <ffee611a-04fa-5019-9786-7c16cae71e87@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [EXTERNAL] [RFC][PATCH 2/3] packagegroups: create initial ti-analytics and ti-demos packagegroups
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
X-List-Received-Date: Tue, 04 Feb 2020 20:28:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Feb 04, 2020 at 03:23:55PM -0500, Jacob Stiffler wrote:
> 
> On 2/4/2020 1:18 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  .../recipes-core/images/tisdk-rootfs-image.bb      |  2 ++
> >  .../packagegroup-arago-tisdk-addons.bb             | 36 +++-------------------
> >  .../recipes-core/packagegroups/ti-analytics.bb     |  9 ++++++
> >  .../recipes-core/packagegroups/ti-demos.bb         |  9 ++++++
> >  .../recipes-core/packagegroups/ti-world.bb         |  2 ++
> >  5 files changed, 27 insertions(+), 31 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> >  create mode 100644 meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> >
> >diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> >index 1b2ffbd..ae026a1 100644
> >--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> >+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
> >@@ -22,6 +22,8 @@ IMAGE_INSTALL += "\
> >      packagegroup-arago-tisdk-addons \
> >      packagegroup-arago-tisdk-addons-extra \
> >      ${@bb.utils.contains('MACHINE_FEATURES','gpu','packagegroup-arago-tisdk-hmi','packagegroup-arago-base-tisdk-server-extra',d)} \
> >+    ti-analytics \
> >+    ti-demos \
> >  "
> >  export IMAGE_BASENAME = "tisdk-rootfs-image"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >index 967fc5d..ddf7785 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
> >@@ -140,42 +140,16 @@ EXTRA_PACKAGES_omapl138 = " \
> >      protobuf \
> >  "
> >-ARMNN_PACKAGES = "armnn"
> >-
> >-EXTRA_PACKAGES_append_ti33x = " voxelsdk \
> >-                                arm-compute-library \
> >-                                ${ARMNN_PACKAGES} \
> >-                                tensorflow-lite-examples \
> >-                                pdm-anomaly-detection \
> >-"
> >-
> >-EXTRA_PACKAGES_append_ti43x = " voxelsdk \
> >-                                arm-compute-library \
> >-                                ${ARMNN_PACKAGES} \
> >-                                tensorflow-lite-examples \
> >-                                pdm-anomaly-detection \
> >-"
> >-
> >-EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
> >-                                   big-data-ipc-demo-linux \
> >-                                   big-data-ipc-demo-linux-firmware \
> >-                                   arm-compute-library \
> >-                                   ${ARMNN_PACKAGES} \
> >-                                   tensorflow-lite-examples \
> >-                                   pdm-anomaly-detection \
> >-"
> >-
> >-EXTRA_PACKAGES_append_am65xx = " arm-compute-library \
> >-                             ${ARMNN_PACKAGES} \
> >-                             tensorflow-lite-examples \
> >-                             pdm-anomaly-detection \
> >-"
> >-
> >  EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
> >  EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
> >  EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
> >  EXTRA_PACKAGES_append_am65xx = " ti-ipc-examples-linux"
> >+EXTRA_PACKAGES_append_omap-a15 = " \
> >+    big-data-ipc-demo-linux \
> >+    big-data-ipc-demo-linux-firmware \
> >+"
> >+
> >  EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps acontis-atemsys"
> >  EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
> >  EXTRA_PACKAGES_append_am57xx-evm = " pruss-lld-apps acontis-atemsys"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> >new file mode 100644
> >index 0000000..e5a13f6
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-core/packagegroups/ti-analytics.bb
> >@@ -0,0 +1,9 @@
> >+SUMMARY = "TI World packagegroup"
> >+LICENSE = "MIT"
> >+
> >+inherit packagegroup
> >+
> >+RDEPENDS_${PN} = "\
> >+    armnn \
> >+    tensorflow-lite-examples \
> >+"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> >new file mode 100644
> >index 0000000..20d73b9
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb
> >@@ -0,0 +1,9 @@
> >+SUMMARY = "TI World packagegroup"
> >+LICENSE = "MIT"
> >+
> >+inherit packagegroup
> >+
> >+RDEPENDS_${PN} = "\
> >+    voxelsdk \
> 
> 
> voxelsdk was not marked as compatible with am65xx:
> 
> 
> ERROR: Nothing RPROVIDES 'voxelsdk' (but /oe/bld/sources/meta-arago-bb/meta-arago-distro/recipes-core/packagegroups/ti-demos.bb RDEPENDS on or otherwise requires it)
> voxelsdk was skipped: incompatible with machine am65xx-evm (not in COMPATIBLE_MACHINE)

Yeah, some of the changes will also break K2, as those are not compatible 
either...
Is there anything specific in voxelsdk that it's not compatible with am65xx? 
Or is it one of those cases of "hasn't been tested on other platforms"?


> >+    pdm-anomaly-detection \
> >+"
> >diff --git a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >index 1aa3a39..164ac63 100644
> >--- a/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >+++ b/meta-arago-distro/recipes-core/packagegroups/ti-world.bb
> >@@ -53,4 +53,6 @@ RDEPENDS_${PN} = "\
> >      ${DEVTOOLS} \
> >      ${@bb.utils.contains('TUNE_FEATURES', 'armv7a', 'valgrind', '', d)} \
> >      packagegroup-arago-misc \
> >+    ti-analytics \
> >+    ti-demos \
> >  "

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


