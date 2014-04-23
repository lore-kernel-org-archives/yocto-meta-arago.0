Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by arago-project.org (Postfix) with ESMTP id 3CC2952A1E
	for <meta-arago@arago-project.org>;
	Wed, 23 Apr 2014 19:42:59 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N4I000BW1EUTS20@vms173025.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 23 Apr 2014 14:42:43 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B4A5D2004B; Wed,
	23 Apr 2014 15:42:30 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 23 Apr 2014 15:42:23 -0400
Message-id: <1398282148-11547-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.2
Subject: [oe-layersetup][PATCH 0/5] RFC: cleanup and remove denzil configs
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
X-List-Received-Date: Wed, 23 Apr 2014 19:43:00 -0000

From: Denys Dmytriyenko <denys@ti.com>

RFC: Remove some cruft of old denzil configs.

I would have left amsdk* and mcsdk* configs alone, if they didn't reference
other config files in sample-files/, which I would like to clean up mostly.

This repository is not tagged, but used as a BOM-reference for old release
configs. Do we need to preserve those files some other place?

Other alternatives for preserving the configs are:
* in a separate "old/deprecated" branch
* in a sub-directory of a similar name
* tagging the repo before removal

Denys Dmytriyenko (5):
  bblayers-denzil: remove denzil-specific bblayers file, deprecated
  local-arago-linaro.conf: remove denzil-specific version setting Linaro
    TC
  mcsdk-03.00.00.xx: remove old denzil-based configs
  arago-denzil-config: remove denzil-specific config
  amsdk-05.06.00.00: remove denzil-specific config

 configs/amsdk/amsdk-05.06.00.00-config.txt  |  10 --
 configs/arago-denzil-config.txt             |  11 --
 configs/mcsdk/mcsdk-03.00.00.03-config.txt  |  10 --
 configs/mcsdk/mcsdk-03.00.00.05-config.txt  |  11 --
 configs/mcsdk/mcsdk-03.00.00.06-config.txt  |  11 --
 configs/mcsdk/mcsdk-03.00.00.07-config.txt  |  11 --
 sample-files/bblayers-denzil.conf.sample    |   9 --
 sample-files/local-arago-linaro.conf.sample | 160 ----------------------------
 8 files changed, 233 deletions(-)
 delete mode 100644 configs/amsdk/amsdk-05.06.00.00-config.txt
 delete mode 100644 configs/arago-denzil-config.txt
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.03-config.txt
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.05-config.txt
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.06-config.txt
 delete mode 100644 configs/mcsdk/mcsdk-03.00.00.07-config.txt
 delete mode 100644 sample-files/bblayers-denzil.conf.sample
 delete mode 100644 sample-files/local-arago-linaro.conf.sample

-- 
1.9.2


