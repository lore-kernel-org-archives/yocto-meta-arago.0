Return-Path: <x0038811@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BD26552995
	for <meta-arago@arago-project.org>;
	Thu,  5 Mar 2020 09:18:59 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0259Guaf061031
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 03:16:56 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1583399816;
	bh=TwWqxeMxmqfgb6wQMGVTY85wIQGf4qAWoPUgpqnFP6k=;
	h=From:To:CC:Subject:Date;
	b=liVYsj128X8DEqScBlELzw6szZJGC8jeJMrJIK4jx0xtrLM1RWSQ/kBHYP/dAL1xB
	62wNxelluu3JYY3GyiuCAjfWE1chuD2A88y75R5hmCLGejInkOWBaLr/+CIgskub4P
	K7V8aoyY2YZQ6j7Ym7Qw0v/8n5L0GTYZlfo2+RV4=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0259GuW6011115
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 5 Mar 2020 03:16:56 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 5 Mar 2020 03:16:55 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 5 Mar 2020 03:16:55 -0600
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0259GsTl020206;
	Thu, 5 Mar 2020 03:16:54 -0600
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 5 Mar 2020 14:46:46 +0530
Message-ID: <1583399809-26608-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master 0/3] Gstreamer 1.16.1 related changes
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
X-List-Received-Date: Thu, 05 Mar 2020 09:19:00 -0000
Content-Type: text/plain

GStreamer 1.16.1 with TI specific patches to
enable waylandsink and a gstreamer good plugin
change related to v4l2src

Ramprasad N (3):
  gstreamer1.0*-bad: Clean up the failing patch
  gstreamer1.0*-bad: Update waylandsink patches
  gstreamer1.0*-good: Check for drm memory support in try_format

 ...ylandsink-Add-mouse-drag-and-drop-support.patch |  50 +++---
 ...-re-order-buffer-creation-for-drm-buffers.patch |  49 ------
 ...ink-Update-wldrm-NV12-offsets-and-strides.patch |  44 -----
 ...aylandsink-Add-drm-support-in-waylandsink.patch | 190 +++++++++++----------
 ...0005-waylandsink-Add-input-device-support.patch | 146 +++++++++-------
 .../gstreamer1.0-plugins-bad_1.16.%.bbappend       |  22 ++-
 ...heck-for-drm-memory-support-in-try_import.patch |  33 ++++
 .../gstreamer1.0-plugins-good_1.16.%.bbappend      |   3 +-
 8 files changed, 255 insertions(+), 282 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-re-order-buffer-creation-for-drm-buffers.patch
 delete mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0002-waylandsink-Update-wldrm-NV12-offsets-and-strides.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good/0001-v4l2src-Check-for-drm-memory-support-in-try_import.patch

-- 
1.9.1


