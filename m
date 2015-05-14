Return-Path: <jake@ubuntu-quadshannondemopc5>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C095452A4F
	for <meta-arago@arago-project.org>;
	Thu, 14 May 2015 14:28:31 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4EESTNl007257
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:30 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4EEST31032534
	for <meta-arago@arago-project.org>; Thu, 14 May 2015 09:28:29 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 14 May 2015 09:28:29 -0500
Received: from Ubuntu-QuadShannonDemoPC5 (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t4EESTs2001460;	Thu, 14 May 2015 09:28:29 -0500
Received: from jake by Ubuntu-QuadShannonDemoPC5 with local (Exim 4.76)
	(envelope-from <jake@ubuntu-quadshannondemopc5>)	id 1Ysu7h-0006nX-ER;
	Thu, 14 May 2015 10:28:29 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 May 2015 10:28:16 -0400
Message-ID: <1431613705-26086-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/9] Switch remaining recipes from gitorious.org to git.ti.com
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
X-List-Received-Date: Thu, 14 May 2015 14:28:32 -0000
Content-Type: text/plain


Jacob Stiffler (9):
  arm-benchmarks: Move SRC_URI to git.ti.com.
  am-sysinfo: Move SRC_URI to git.ti.com.
  matrix-gui-browser: Move SRC_URI to git.ti.com.
  matrix-gui: Move SRC_URI to git.ti.com.
  refresh-screen: Move SRC_URI to git.ti.com.
  oprofile-example: Move SRC_URI to git.ti.com.
  screenshot: Move SRC_URI to git.ti.com.
  av-examples: Move SRC_URI to git.ti.com.
  image-gallery: Move SRC_URI to git.ti.com.

 .../arm-benchmarks/arm-benchmarks_1.3.bb           |    2 +-
 .../recipes-core/am-sysinfo/am-sysinfo_git.bb      |    2 +-
 .../recipes-core/matrix/matrix-gui-browser_2.0.bb  |    2 +-
 .../recipes-core/matrix/matrix-gui_2.0.bb          |    2 +-
 .../recipes-core/matrix/refresh-screen_2.0.bb      |    2 +-
 .../oprofile-example/oprofile-example_git.bb       |    2 +-
 .../recipes-graphics/screenshot/screenshot_1.0.bb  |    2 +-
 .../av-examples/av-examples_1.0.bb                 |    2 +-
 .../recipes-qt/qt-apps/image-gallery_git.bb        |    2 +-
 9 files changed, 9 insertions(+), 9 deletions(-)

-- 
1.7.9.5


