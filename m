Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id F3152529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:29:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMTQ1e081929
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:29:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534890566;
	bh=fs0XVB6u0lC92/hLeNayM6rkPxSMpxUapxngxCgnJ+g=;
	h=From:To:Subject:Date;
	b=cgXwuGL21JxnfIJpPJcwI+rWCi+QAv2KihNt+T5fksXqHeO2LLd9PqiTqd2i0zWF0
	afJ5GrvHxuR2NocDuPHmTdT8VByyIfoqmVP/9D75CIfR1C+ut9s2mWmcZ1krJWQkl1
	D3SCXQciY4anoQgW4bm1wKPjceBh/9TN6jeqHcEY=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMTQiX023782
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:29:26 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:29:26 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:29:26 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMTPKp031317
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:29:26 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 18:29:18 -0400
Message-ID: <1534890562-62245-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 0/4] Enable GTK+3
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
X-List-Received-Date: Tue, 21 Aug 2018 22:29:34 -0000
Content-Type: text/plain

Enable GTK+3

v2 changes:
- make packagegroup-arago-tisdk-gtk conditional on sgx

Eric Ruei (4):
  gtk+3: update wayland dependency and add patches
  packagegroup-arago-gtk: add package group files for GTK
  tisdk-roofs-image: add the GTK packagegroup
  packagegroup-arago-toolchain-tidsk-target: add GTK packagegroup

 .../recipes-core/images/tisdk-rootfs-image.bb      |  1 +
 .../packagegroup-arago-gtk-sdk-target.bb           | 11 ++++
 .../packagegroups/packagegroup-arago-tisdk-gtk.bb  | 20 +++++++
 .../packagegroup-arago-toolchain-tisdk-target.bb   |  9 +++-
 ...t-wayland.c-cleanup-the-parameters-of-egl.patch | 61 ++++++++++++++++++++++
 .../recipes-gnome/gtk+/gtk+3_%.bbappend            | 10 ++++
 6 files changed, 111 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gtk-sdk-target.bb
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-gtk.bb
 create mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3/0001-gdkglcontext-wayland.c-cleanup-the-parameters-of-egl.patch
 create mode 100644 meta-arago-distro/recipes-gnome/gtk+/gtk+3_%.bbappend

-- 
1.9.1


