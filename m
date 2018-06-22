Return-Path: <x0038811@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 98A58529F7
	for <meta-arago@arago-project.org>;
	Fri, 22 Jun 2018 11:28:13 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w5MBS7rT025931
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 06:28:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1529666887;
	bh=cycFbNqdjC1JdM1wjUYvPX6C1WCzGWLa1TpqIFPcBk4=;
	h=From:To:CC:Subject:Date;
	b=ed9FG8LgrbOEjRS/AwWxG4qKkc0K5FOETUD4tgDn30iq8osfLWNutplf8kRE3OE4f
	z0U6gQQOdcbh4Z4/2nRaeFtPTQ/dMZk1H6PHSUL/0xJHisNOwhBlcNyl1TbSLmPvZE
	AOTcPZlWLCLPqPXHOOXfTir9QyPjCcFVOqYK7Jhw=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MBS7PY019584
	for <meta-arago@arago-project.org>; Fri, 22 Jun 2018 06:28:07 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 22 Jun 2018 06:28:07 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 22 Jun 2018 06:28:07 -0500
Received: from udx0038811.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w5MBS5m9019760;
	Fri, 22 Jun 2018 06:28:06 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 22 Jun 2018 16:58:03 +0530
Message-ID: <1529666884-6396-1-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 0/1] gstwaylandsink
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
X-List-Received-Date: Fri, 22 Jun 2018 11:28:14 -0000
Content-Type: text/plain

Add input device like mouse, touch etc to waylandsink.

Ramprasad N (1):
  gstreamer1.0*-bad: Input device support in waylandsink

 ...ylandsink-Add-mouse-drag-and-drop-support.patch | 426 +++++++++
 ...0005-waylandsink-Add-input-device-support.patch | 990 +++++++++++++++++++++
 .../gstreamer1.0-plugins-bad_1.12.2.bbappend       |   5 +-
 3 files changed, 1420 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-waylandsink-Add-mouse-drag-and-drop-support.patch
 create mode 100644 meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0005-waylandsink-Add-input-device-support.patch

-- 
1.9.1


