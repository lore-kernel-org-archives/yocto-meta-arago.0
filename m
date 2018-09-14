Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A1003520E4
	for <meta-arago@arago-project.org>;
	Fri, 14 Sep 2018 21:07:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8EL7o1U115863
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536959270;
	bh=HlpTioc0KtjmIlgcksZ7s5cs2qV47KX7xuHVVp1GG/E=;
	h=From:To:Subject:Date;
	b=K0kkqt4EvAxOKKtjGG1kR3PBYYyqfyAc49g93UVs7AMI0N/uUUHDrvI2z5XryQqkB
	cOM3q9F3hhnyV6iuudfJ3vDShwsqrpnzocvg7dLM5Su9tz4FN7Bo5KElK/tHvUP7wi
	vZkQ/wccNfFfsTrTmwzMlP7GFgHZXi0o4RDGzaBU=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EL7nJa007402
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 14 Sep 2018 16:07:49 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 14 Sep 2018 16:07:49 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8EL7mCa016015
	for <meta-arago@arago-project.org>; Fri, 14 Sep 2018 16:07:49 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Sep 2018 17:07:43 -0400
Message-ID: <1536959265-3351-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 0/2] Use the webkit-based broswer as the qt5 demo broswer for k3 devices
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
X-List-Received-Date: Fri, 14 Sep 2018 21:07:59 -0000
Content-Type: text/plain

V2 changes:
rebase patch "matrix-gui: qt5-demos: break qt5 demos package into individual 
ones"

Eric Ruei (2):
  matrix-gui: qt5-demos: break qt5 demos package into individual ones
  packagegroup-arago-tisdk-matrix: replace qt5 demo browser with webkit
    broswer for K3 devices

 .../packagegroup-arago-tisdk-matrix.bb              | 11 +++++++++--
 .../recipes-core/matrix/matrix-gui-apps-git.inc     |  4 ++--
 .../recipes-core/matrix/matrix-gui-qt5-demos_2.0.bb | 21 ++++++++++++++++++++-
 3 files changed, 31 insertions(+), 5 deletions(-)

-- 
1.9.1


