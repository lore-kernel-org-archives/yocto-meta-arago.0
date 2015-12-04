Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 76D1C52AC2
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 15:01:14 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4F1DiU001448
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:13 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1Dkf003101
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:13 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 09:01:12 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1DuF003774;
	Fri, 4 Dec 2015 09:01:13 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1a4rrE-0001e8-Kc; Fri, 04 Dec 2015 10:01:12 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Dec 2015 10:01:05 -0500
Message-ID: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 0/5] Keystone enhancements
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
X-List-Received-Date: Fri, 04 Dec 2015 15:01:14 -0000
Content-Type: text/plain

* Enhance board detection for K2E and K2L
* Enahnce u-boot update with error checking and the ability to update
  from MCSDK u-boot
* Add support for K2G

Jacob Stiffler (5):
  setup-minicom: Update list of auto-detected EVMs
  setup-uboot-env-keystone: Enhance board detection for k2l and k2e
  setup-uboot-env-keystone: Add error checking to u-boot update
  setup-tftp: Copy pmmc-firmware if available
  setup-uboot-env-k2g-evm: Add u-boot setup for k2g-evm

 setup-minicom.sh            |   3 +-
 setup-tftp.sh               |   3 +
 setup-uboot-env-k2g-evm.sh  | 253 ++++++++++++++++++++++++++++++++++++++++++++
 setup-uboot-env-keystone.sh | 146 +++++++++++++++++++------
 4 files changed, 369 insertions(+), 36 deletions(-)
 create mode 100755 setup-uboot-env-k2g-evm.sh

-- 
1.9.1


