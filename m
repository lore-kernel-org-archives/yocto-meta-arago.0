Return-Path: <e-ruei1@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id D52C452ABA
	for <meta-arago@arago-project.org>;
	Thu,  9 Mar 2017 21:27:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v29LRgbC008499
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:42 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489094862;
	bh=CZrj1yauB95UjaUMJXBw3JMhxCf9lnn6v0z37wBcqpk=;
	h=From:To:Subject:Date;
	b=A48tPNuz59kW2B4/U/OQElXevYdNYngt7EoflT3W6esgqIRwnHKw43qPVpPIS7ICR
	9/3aEoRPAAa/4kYTw2mbgsUQbvH7VlTEP0MSVMY7RXW6FxCVRyVhoY01Km7kAtFQLW
	7jchHGkpgZLVGtIidgfR91+R+krq0P9npjwHQq54=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v29LRgaM004772
	for <meta-arago@arago-project.org>; Thu, 9 Mar 2017 15:27:42 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Mar 2017 15:27:41 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v29LRfEo025736	for <meta-arago@arago-project.org>;
	Thu, 9 Mar 2017 15:27:42 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 9 Mar 2017 16:27:32 -0500
Message-ID: <1489094857-27497-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty][PATCH V2 0/5] weston: re-apply multiple patches from weston 1.9
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
X-List-Received-Date: Thu, 09 Mar 2017 21:27:44 -0000
Content-Type: text/plain


Eric Ruei (5):
  weston: allow visual_id to be 0 to fix EGL config failure
  weston: fix virtual keyboard display issue of QT5 applications
  weston: fix touch screen crash issue
  weston: fix hotplug weston termination problem
  weston: add RGB565 support for pixman renderer

 ...positor-drm-support-RGB565-with-pixman-renderer.patch | 16 ++++++++--------
 ...0.patch => 0002-Weston-Allow-visual_id-to-be-0.patch} | 10 +++++-----
 ...-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch} | 11 +++++------
 ...ch => 0004-Weston-Fix-touch-screen-crash-issue.patch} | 11 +++++------
 .../recipes-graphics/wayland/weston_1.11.0.bbappend      |  7 ++++++-
 5 files changed, 29 insertions(+), 26 deletions(-)
 rename meta-arago-distro/recipes-graphics/wayland/weston/{0002-Weston1.9.0-Allow-visual_id-to-be-0.patch => 0002-Weston-Allow-visual_id-to-be-0.patch} (72%)
 rename meta-arago-distro/recipes-graphics/wayland/weston/{0003-Weston1.9.0-Fix-virtual-keyboard-display-issue-for-Q.patch => 0003-Weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch} (81%)
 rename meta-arago-distro/recipes-graphics/wayland/weston/{0004-Weston1.9.0-Fix-touch-screen-crash-issue.patch => 0004-Weston-Fix-touch-screen-crash-issue.patch} (79%)

-- 
1.9.1


