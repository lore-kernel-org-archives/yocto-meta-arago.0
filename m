Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3917D52A63
	for <meta-arago@arago-project.org>;
	Tue,  1 Aug 2017 19:54:14 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v71JsE7S001349
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1501617254;
	bh=ckoUMmPCTFJdioaLYfB5NNrlV9LJWS2Aqm3XXHUkMwg=;
	h=From:To:Subject:Date;
	b=YtjSvHo4F3ZJUbnA5gWVmDWRyd+0sf7ZCgq6Ezz/BQVAV+ZXdpWHBtnOHALVVt2Pv
	1kBR780C8CHPsTyGVXuUwzY3zHthQZ+1Fobc9h7hdnzYPYIYnpJR8OtPMB8u/ypZzF
	Ce6jtI0fOS5pqpJJT1AAsN9t4On9W5NrB84OUKPk=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v71JsEw9019465
	for <meta-arago@arago-project.org>; Tue, 1 Aug 2017 14:54:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 1 Aug 2017 14:54:13 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v71JsAQc012102	for <meta-arago@arago-project.org>;
	Tue, 1 Aug 2017 14:54:12 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Aug 2017 15:54:04 -0400
Message-ID: <1501617248-46185-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 0/4] matrix-gui: add browser demos
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
X-List-Received-Date: Tue, 01 Aug 2017 19:54:14 -0000
Content-Type: text/plain

OOB Matrix Gui: add browser submenu and browser demos

Eric Ruei (4):
  matrix-gui-apps-git: bump SRCREV to pick up the browser demos
  matix-gui-browser-demos: add browser demos
  matrix-gui-submenu: add browser submenu
  packagegroup-arago-tisdk-matrix: add browser demos for AM5/DRA7

 .../packagegroups/packagegroup-arago-tisdk-matrix.bb     |  3 ++-
 .../recipes-core/matrix/matrix-gui-apps-git.inc          |  4 ++--
 .../recipes-core/matrix/matrix-gui-browser-demos_2.0.bb  | 16 ++++++++++++++++
 .../recipes-core/matrix/matrix-gui-submenus_2.0.bb       |  5 ++++-
 4 files changed, 24 insertions(+), 4 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/matrix/matrix-gui-browser-demos_2.0.bb

-- 
1.9.1


