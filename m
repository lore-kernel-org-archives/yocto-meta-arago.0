Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D48F852AA7
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 21:47:48 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DLleou013807
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 16:47:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536875260;
	bh=XZp/qCkyujwC/Lbep7ahvK9RbAn9y+STCq9YQ8mkmsA=;
	h=From:To:Subject:Date;
	b=o9BAoEQTW+BwFdLPoqV0w7Q+GhKpppgXarSc73KudKm8hk9fVFiHk1KIDsrdDnDtt
	OdXw48beiE1MaW99CYdWNGjuTagzvdPpvRuL6iP5ZBCcdEyjMOcM8mfCITH4srxM6I
	iPNSxwL62Sorgr4TPnATi8lG2UDlzVDUmceaEhfk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DLleaE004604
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 16:47:40 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 16:47:40 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 16:47:40 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DLler9010574
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 16:47:40 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 13 Sep 2018 17:47:35 -0400
Message-ID: <1536875257-56734-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 0/2] Use the webkit-based broswer as the qt5 demo broswer for k3 devices
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
X-List-Received-Date: Thu, 13 Sep 2018 21:47:50 -0000
Content-Type: text/plain

Eric Ruei (2):
  matrix-gui: qt5-demos: break qt5 demos package into individual ones
  packagegroup-arago-tisdk-matrix: replace qt5 demo browser with webkit
    broswer for K3 devices

 .../packagegroup-arago-tisdk-matrix.bb             | 11 ++++++++--
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |  4 ++--
 .../matrix/matrix-gui-qt5-demos_2.0.bb             | 25 +++++++++++++++++-----
 3 files changed, 31 insertions(+), 9 deletions(-)

-- 
1.9.1


