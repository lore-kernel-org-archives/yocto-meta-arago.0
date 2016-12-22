Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 61DC952AE6
	for <meta-arago@arago-project.org>;
	Thu, 22 Dec 2016 14:25:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBMEPa18021847
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPau7012493
	for <meta-arago@arago-project.org>; Thu, 22 Dec 2016 08:25:36 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBMEPZYo032445;
	Thu, 22 Dec 2016 08:25:35 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cK4JK-00043r-ER; Thu, 22 Dec 2016 09:25:34 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Dec 2016 09:25:21 -0500
Message-ID: <1482416729-15556-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 0/8] keystone: utilize UART boot
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
X-List-Received-Date: Thu, 22 Dec 2016 14:25:40 -0000
Content-Type: text/plain

For keystone EVMs, there is no MMC interface, so U-Boot cannot be
updated by simply flashing an SD card. U-Boot is updated by using a
another instance of U-Boot to flash the board. Howver, a board may or
may not have U-Boot flashed, and if it is, it is unmanageable to
support all possible versions of U-Boot and the various default
environments.

Therefore these patches automate using UART boot to boot an instance
of the packaged version of U-Boot which is used to flash and configure
the board. In this way, only the packaged version of U-Boot needs to
be supported.

Jacob Stiffler (8):
  setup-uboot-env-keystone.sh: add prompt_feedback function
  setup-uboot-env-keystone.sh: enhance do_expect function
  setup-uboot-env-keystone.sh: add detection of BMC port
  setup-uboot-env-keystone.sh: make updating ubifs an independent option
  setup-uboot-env-keystone.sh: create minicom script to update board
  add-to-group: require user to logout for group change
  setup-package-install: Add screen and lrzsz packages
  setup-uboot-env-keystone: use UART boot to boot latest version of
    U-Boot

 add-to-group.sh             |   2 +
 setup-package-install.sh    |   2 +-
 setup-uboot-env-keystone.sh | 379 ++++++++++++++++++++++++++------------------
 3 files changed, 225 insertions(+), 158 deletions(-)

-- 
1.9.1


