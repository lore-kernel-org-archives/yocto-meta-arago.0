Return-Path: <x0211375@psplinux052>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 576A452A82
	for <meta-arago@arago-project.org>;
	Fri,  6 Dec 2013 09:55:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id rB69tkiv015183
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 03:55:46 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB69tk31022856
	for <meta-arago@arago-project.org>; Fri, 6 Dec 2013 03:55:46 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 6 Dec 2013 03:55:46 -0600
Received: from psplinux052 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rB69tjhG001371;
	Fri, 6 Dec 2013 03:55:45 -0600
Received: from x0211375 by psplinux052 with local (Exim 4.76)	(envelope-from
	<x0211375@psplinux052>)	id 1Vos8O-0004s7-Gj;
	Fri, 06 Dec 2013 15:25:44 +0530
From: Rajasekar <x0211375@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Dec 2013 15:25:41 +0530
Message-ID: <1386323741-18669-1-git-send-email-x0211375@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Rajasekar <x0211375@ti.com>
Subject: [PATCH 0/2] machine config for am438x EPOS and am437x HS evm
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
X-List-Received-Date: Fri, 06 Dec 2013 09:55:47 -0000
Content-Type: text/plain

Deepak M (1):
  am43xx: Added machine config for am437x HS evm

Rajasekar (1):
  am438x : Added machine config for am438x EPOS machine

 conf/machine/am437x-hs-evm.conf   |   39 +++++++++++++++++++++++++++++++++++++
 conf/machine/am438x-epos-evm.conf |   36 ++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+)
 create mode 100644 conf/machine/am437x-hs-evm.conf
 create mode 100644 conf/machine/am438x-epos-evm.conf

-- 
1.7.9.5


