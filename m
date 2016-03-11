Return-Path: <h-gou@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DE58352A60
	for <meta-arago@arago-project.org>;
	Fri, 11 Mar 2016 22:02:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2BM2J9L006607
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2BM2JGR016101
	for <meta-arago@arago-project.org>; Fri, 11 Mar 2016 16:02:19 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 11 Mar 2016 16:02:19 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u2BM2I6G011570;	Fri, 11 Mar 2016 16:02:18 -0600
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Mar 2016 17:02:09 -0500
Message-ID: <1457733732-18531-1-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Add HEVC ARM decoder and its gst plugin for keystone
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
X-List-Received-Date: Fri, 11 Mar 2016 22:02:20 -0000
Content-Type: text/plain

Hongmei Gou (3):
  hevc-arm-decoder: add support for keystone platforms
  gstreamer1.0-plugins-hevc: add support for keystone platforms
  packagegroup-arago-gst*: add gstreamer1.0-plugins-hevc for keystone

 .../packagegroups/packagegroup-arago-gst-sdk-target.bb           | 6 +++++-
 .../recipes-core/packagegroups/packagegroup-arago-gst.bb         | 6 +++++-
 .../gst-plugins-ti/gstreamer1.0-plugins-hevc_git.bb              | 9 ++++-----
 .../hevc-arm-decoder/hevc-arm-decoder_01.00.00.01.bb             | 4 ++--
 4 files changed, 16 insertions(+), 9 deletions(-)

-- 
1.9.1


