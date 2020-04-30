Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id ADC2752A30
	for <meta-arago@arago-project.org>;
	Thu, 30 Apr 2020 22:57:37 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 03UMtGVd036432
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 17:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588287316;
	bh=sk66JS5ZEDUnoxK9URukoR3rOBUwwYFuxKfukdopOMI=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=au114jmkK8iFqWomyif+hbITB5SnGCzvUVwKkazIzCXMl/8piCN7As8Csa0uvGLxB
	B8OMhITKU6yDOvo2B+6aErva39h3gbWl5TQIufZ7tdp2loyw3OLsyoFZ5Uvo1E0nZM
	b9QrhnYQNkl9uivyHTax1MOOmWMBpS3v47gfVT8k=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UMtGlE128735
	for <meta-arago@arago-project.org>; Thu, 30 Apr 2020 17:55:16 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 30 Apr 2020 17:55:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 30 Apr 2020 17:55:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 03UMtFrg051080;
	Thu, 30 Apr 2020 17:55:15 -0500
Date: Thu, 30 Apr 2020 18:55:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Nikhil Devshatwar <nikhil.nd@ti.com>
Message-ID: <20200430225515.GA11212@beryl>
References: <20200426174223.8089-1-nikhil.nd@ti.com>
	<20200427223734.GD395@beryl>
	<f57d9d3d-c065-6ed6-c52b-c9f9698a51de@ti.com>
MIME-Version: 1.0
In-Reply-To: <f57d9d3d-c065-6ed6-c52b-c9f9698a51de@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [zeus PATCH v1 1/2] recipes-devtools: websocketd: Add new recipe for websocket app
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
X-List-Received-Date: Thu, 30 Apr 2020 22:57:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Apr 29, 2020 at 12:31:44PM +0530, Nikhil Devshatwar wrote:
> 
> 
> On 28/04/20 4:07 am, Denys Dmytriyenko wrote:
> >On Sun, Apr 26, 2020 at 11:12:22PM +0530, nikhil.nd@ti.com wrote:
> >>From: Nikhil Devshatwar <nikhil.nd@ti.com>
> >>
> >>websocketd is a userspace application which allows to send
> >>data over web sockets. This is used in SDK for visualizing
> >>statistics parameters.
> >>
> >>Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> >>---
> >>  ...packagegroup-arago-tisdk-addons-sdk-target.bb |  4 +++-
> >>  .../recipes-devtools/websocketd/websocketd.bb    | 16 ++++++++++++++++
> >>  2 files changed, 19 insertions(+), 1 deletion(-)
> >>  create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> >>
> >>diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >>index 26925f2f..54a59022 100644
> >>--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >>+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
> >>@@ -133,7 +133,9 @@ UTILS_append_dra7xx = " can-utils-dev \
> >>                          elfutils-staticdev \
> >>  "
> >>  UTILS_append_k2g = " can-utils-dev"
> >>-UTILS_append_k3 = " can-utils-dev"
> >>+UTILS_append_k3 = " can-utils-dev \
> >>+                    websocketd \
> >Why are you adding it to the devkit?
> This is an on target utility.
> Please suggest the best place for including this.

Sorry, missed answering your questions earlier - looks like you already 
figured it out in v2...


> Regards,
> Nikhil D
> >
> >>+"
> >>  EXTRA_LIBS = ""
> >>  EXTRA_LIBS_append_ti43x = "\
> >>diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> >>new file mode 100644
> >>index 00000000..44f549ee
> >>--- /dev/null
> >>+++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd.bb
> >>@@ -0,0 +1,16 @@
> >>+SUMMARY = "Application for routing native applications via websockets"
> >>+HOMEPAGE = "http://websocketd.com/"
> >>+
> >>+LICENSE = "BSD-2-Clause"
> >>+LIC_FILES_CHKSUM = "file://LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
> >>+
> >>+PV = "0.3.0"
> >>+SRC_URI = "https://github.com/joewalnes/websocketd/releases/download/v${PV}/websocketd-${PV}-linux_arm64.zip"
> >>+SRC_URI[md5sum] = "968c1ce4ed4fe5f86817f2533f5d3004"
> >>+
> >>+S = "${WORKDIR}"
> >>+
> >>+do_install() {
> >>+	install -d ${D}/${bindir}
> >>+	install -m 0755 ${S}/websocketd ${D}${bindir}/
> >>+}
> >>-- 
> >>2.17.1
> >>
> 

