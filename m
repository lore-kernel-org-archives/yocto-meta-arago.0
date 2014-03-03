Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTP id 0905952986
	for <meta-arago@arago-project.org>;
	Mon,  3 Mar 2014 23:36:42 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N1V006LYW8PGGC0@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 03 Mar 2014 17:36:41 -0600 (CST)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 2C235201BF; Mon,
	03 Mar 2014 18:36:25 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 03 Mar 2014 18:36:14 -0500
Message-id: <1393889779-3995-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.3.2
Subject: [tisdk-build-scripts][PATCH 0/5] updates for several recent OpenTest framework changes
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
X-List-Received-Date: Mon, 03 Mar 2014 23:36:43 -0000

From: Denys Dmytriyenko <denys@ti.com>

There were several changes made in the OpenTest framework configuration and
setup in the past few months, breaking compatibility with the old CLI client
as well as several other assumptions made in the build scripts. This patchset
updates the scripts with the new CLI and other config options to work with
the new OpenTest framework setup again.

Denys Dmytriyenko (5):
  run-opentest: make assigning tests to a specific TEE optional
  run-opentest: pass test_scripts_root to always get latest vatf from
    git
  run-opentest: add support for new version of opentest CLI
  linux-devtest.tgz: add new version of OpenTest CLI 13.11
  arago-core-tisdk-dylan-puget: update to use new CLI

 configs/arago-core-tisdk-dylan-puget.txt |    4 ++--
 lib/run-opentest                         |   25 ++++++++++++++++++++++---
 linux-devtest.tgz                        |  Bin 0 -> 505553 bytes
 3 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 linux-devtest.tgz

-- 
1.7.9.5


