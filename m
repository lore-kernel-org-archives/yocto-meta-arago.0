Return-Path: <denis@denix.org>
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by arago-project.org (Postfix) with ESMTP id 7D795529F0
	for <meta-arago@arago-project.org>;
	Tue,  2 Apr 2013 00:52:20 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKL007STRQ43L30@vms173005.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 01 Apr 2013 19:51:55 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 1708120033; Mon,
	01 Apr 2013 20:51:40 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 01 Apr 2013 20:51:05 -0400
Message-id: <1364863868-14687-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH 0/3] RFC: Add branding support for products to tweak preferences
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
X-List-Received-Date: Tue, 02 Apr 2013 00:52:21 -0000

From: Denys Dmytriyenko <denys@ti.com>

* For cases when products based on Arago Core TI-SDK need to select different
  providers or versions of packages. For example, AM-SDK needs to stay on the
  stable kernel 3.2, while Core TI-SDK is moving to the new kernel 3.8.
* Adding new branding policies requires creating a new branding-<name>.inc file
  and setting ARAGO_BRAND=<name> in the local.conf
* The default branding is "core" when ARAGO_BRAND is not set and is mostly empty
  to fall back on the default Arago Core TI-SDK preferences.

Denys Dmytriyenko (3):
  arago.conf: add branding support to allow products to tweak
    preferences
  branding-amsdk: add the initial AM-SDK branding policy
  arago-prefs: set default preferences to the latest TI staging kernel
    and u-boot

 meta-arago-distro/conf/distro/arago.conf                 | 7 +++++++
 meta-arago-distro/conf/distro/include/arago-prefs.inc    | 9 +++------
 meta-arago-distro/conf/distro/include/branding-amsdk.inc | 8 ++++++++
 meta-arago-distro/conf/distro/include/branding-core.inc  | 6 ++++++
 4 files changed, 24 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/conf/distro/include/branding-amsdk.inc
 create mode 100644 meta-arago-distro/conf/distro/include/branding-core.inc

-- 
1.8.1.5


