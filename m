Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id C30B352ACF
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 18:46:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uAIIk4pO026823
	for <meta-arago@arago-project.org>; Fri, 18 Nov 2016 12:46:04 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uAIIk46K009161
	for <meta-arago@arago-project.org>; Fri, 18 Nov 2016 12:46:04 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 18 Nov 2016 12:46:03 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	uAIIk3Cb017375	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 12:46:03 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 18 Nov 2016 13:45:56 -0500
Message-ID: <1479494759-57664-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] packagegroup: Add QtWebengine when using QT5
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
X-List-Received-Date: Fri, 18 Nov 2016 18:46:05 -0000
Content-Type: text/plain

Include QtWebengine at the QT5 package 

Eric Ruei (3):
  packagegroup-arago-qte: Add QtWebengine when using Qt5
  packagegroup-arago-tisdk-qte: Add QtWebengine examples to Qt5 demos
  packagegroup-arago-qte-toolchain-target:Add QtWebengine when using Qt5

 .../recipes-core/packagegroups/packagegroup-arago-qte.bb              | 3 ++-
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-qte.bb        | 3 ++-
 .../packagegroups/packagegroup-arago-qte-toolchain-target.bb          | 4 +++-
 3 files changed, 7 insertions(+), 3 deletions(-)

-- 
1.9.1


