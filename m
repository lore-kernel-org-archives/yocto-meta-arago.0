Return-Path: <denis@denix.org>
Received: from vms173009pub.verizon.net (vms173009pub.verizon.net
	[206.46.173.9])
	by arago-project.org (Postfix) with ESMTPS id 5AA59529E7
	for <meta-arago@arago-project.org>;
	Wed, 20 Apr 2016 19:33:49 +0000 (UTC)
Received: from vz-proxy-l004.mx.aol.com ([64.236.82.151])
	by vms173009.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O5Y00GVW6BXKK20@vms173009.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 20 Apr 2016 14:33:34 -0500 (CDT)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=WcjxEBVX c=1 sm=1 tr=0	a=eaPqxu9IKnv3tbb7QsXVMw==:117
	a=kziv93cY1bsA:10 a=sozttTNsAAAA:8	a=eMoXSQ7-mciLSomT0U8A:9
Received: by 100.15.86.14 with SMTP id 5c24b14f; Wed, 20 Apr 2016 19:33:34 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 9AACA161F9C;	Wed,
	20 Apr 2016 15:33:32 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 20 Apr 2016 15:33:09 -0400
Message-id: <1461180805-25733-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH 00/16] Clean up meta-arago-extras
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
X-List-Received-Date: Wed, 20 Apr 2016 19:33:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Clean up meta-arago-extras. Remove code that was already upstreamed or
otherwise available from oe-core or meta-oe layers.

Denys Dmytriyenko (16):
  memtester: change got upstreamed, drop locally
  linuxptp: available now in meta-oe, drop locally
  lksctp-tools: available in meta-networking, drop locally
  obexftp: available from meta-oe, drop locally
  dropbear: newer version was backported from oe-core to fido, remove
    now
  dosfstools: remove large-file bbappend, oe-core now has it
  libevdev: available from oe-core, drop locally
  mmc-utils: was upstreamed to oe-core, drop locally
  nodejs: available from meta-oe, drop locally
  serialcheck: upstreamed to meta-oe, drop locally
  stress: available from oe-core, drop locally
  ethtool: oe-core has the latest, drop locally
  smcroute: got upstreamed to meta-networking, drop locally
  boost: oe-core now supports nativesdk, drop bbappend locally
  strongswan: version 5.3.2 available in meta-oe, drop locally
  syslog-ng: available from meta-oe now, drop locally

 .../memtester/files/Makefile.patch                 |  28 --
 .../recipes-benchmark/memtester/memtester_4.3.0.bb |  25 --
 .../recipes-connectivity/linuxptp/linuxptp_1.3.bb  |  20 -
 .../lksctp-tools/lksctp-tools_1.0.16.bb            |  46 --
 .../recipes-connectivity/obexftp/obexftp_0.23.bb   |  29 --
 .../recipes-core/dropbear/dropbear.inc             | 103 -----
 .../0001-urandom-xauth-changes-to-options.h.patch  |  23 -
 .../dropbear/dropbear/0003-configure.patch         |  42 --
 .../dropbear/dropbear/0004-fix-2kb-keys.patch      |  22 -
 .../dropbear/0005-dropbear-enable-pam.patch        |  36 --
 .../0006-dropbear-configuration-file.patch         |  22 -
 .../dropbear/0007-dropbear-fix-for-x32-abi.patch   | 140 ------
 .../recipes-core/dropbear/dropbear/dropbear        |   4 -
 .../recipes-core/dropbear/dropbear/dropbear.socket |  10 -
 .../dropbear/dropbear/dropbear@.service            |  12 -
 .../dropbear/dropbear/dropbearkey.service          |  13 -
 .../recipes-core/dropbear/dropbear/init            | 113 -----
 .../recipes-core/dropbear/dropbear_2015.71.bb      |   5 -
 .../dosfstools/dosfstools_2.11.bbappend            |   5 -
 .../recipes-devtools/libevdev/libevdev_git.bb      |  16 -
 .../recipes-devtools/mmc/mmc-utils_git.bb          |  17 -
 .../nodejs/nodejs/no-registry.patch                |  59 ---
 .../recipes-devtools/nodejs/nodejs_4.2.3.bb        |  84 ----
 ...01-Add-option-to-enable-internal-loopback.patch |  80 ----
 .../0002-Restore-original-loopback-config.patch    |  48 --
 .../serialcheck/serialcheck_1.0.0.bb               |  22 -
 .../recipes-devtools/stress/files/texinfo.patch    |  79 ----
 .../recipes-devtools/stress/stress_1.0.4.bb        |  16 -
 .../ethtool/ethtool/avoid_parallel_tests.patch     |  19 -
 .../ethtool/ethtool/ethtool-uint.patch             |  50 ---
 .../recipes-extended/ethtool/ethtool/run-ptest     |   2 -
 .../recipes-extended/ethtool/ethtool_3.16.bb       |  31 --
 .../recipes-extended/smcroute/smcroute_2.0.0.bb    |  13 -
 .../recipes-support/boost/boost_%.bbappend         |   1 -
 .../strongswan/files/fix-funtion-parameter.patch   |  98 ----
 .../recipes-support/strongswan/strongswan_5.3.2.bb |  45 --
 .../Fix-the-memory-leak-problem-for-mutex.patch    |  58 ---
 ...ry-leak-problem-when-HAVE_ENVIRON-defined.patch |  27 --
 .../files/afsql-afsql_dd_insert_db-refactor.patch  | 494 ---------------------
 ...c-add-option-enable-thread-tls-to-manage-.patch |  50 ---
 .../syslog-ng/files/configure.patch                |  23 -
 .../recipes-support/syslog-ng/files/dbifix.patch   |  20 -
 ...init-the-new-config-when-reverting-to-the.patch |  36 --
 .../fix-a-memory-leak-in-log_driver_free.patch     |  33 --
 .../syslog-ng/files/fix-config-libnet.patch        |  66 ---
 .../syslog-ng/files/fix-invalid-ownership.patch    |  28 --
 .../files/free-global-LogTemplateOptions.patch     |  30 --
 .../recipes-support/syslog-ng/files/initscript     |  62 ---
 .../logwriter-dont-allocate-a-new-buffer.patch     |  26 --
 .../rewrite-expr-grammar.ym-Free-up-token.patch    |  17 -
 .../files/still-free-the-unconsumed-item.patch     |  90 ----
 .../syslog-ng-verify-the-list-before-del.patch     |  38 --
 .../recipes-support/syslog-ng/files/syslog-ng.conf | 155 -------
 .../syslog-ng/files/volatiles.03_syslog-ng         |   1 -
 .../recipes-support/syslog-ng/syslog-ng.inc        | 106 -----
 .../recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb |  21 -
 56 files changed, 2759 deletions(-)
 delete mode 100644 meta-arago-extras/recipes-benchmark/memtester/files/Makefile.patch
 delete mode 100644 meta-arago-extras/recipes-benchmark/memtester/memtester_4.3.0.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/linuxptp/linuxptp_1.3.bb
 delete mode 100755 meta-arago-extras/recipes-connectivity/lksctp-tools/lksctp-tools_1.0.16.bb
 delete mode 100644 meta-arago-extras/recipes-connectivity/obexftp/obexftp_0.23.bb
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear.inc
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0001-urandom-xauth-changes-to-options.h.patch
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0003-configure.patch
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0004-fix-2kb-keys.patch
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0005-dropbear-enable-pam.patch
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0006-dropbear-configuration-file.patch
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/0007-dropbear-fix-for-x32-abi.patch
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbear
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbear.socket
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbear@.service
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear/dropbearkey.service
 delete mode 100755 meta-arago-extras/recipes-core/dropbear/dropbear/init
 delete mode 100644 meta-arago-extras/recipes-core/dropbear/dropbear_2015.71.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/dosfstools/dosfstools_2.11.bbappend
 delete mode 100644 meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/mmc/mmc-utils_git.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/nodejs/nodejs/no-registry.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/nodejs/nodejs_4.2.3.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0001-Add-option-to-enable-internal-loopback.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/serialcheck/serialcheck/0002-Restore-original-loopback-config.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/serialcheck/serialcheck_1.0.0.bb
 delete mode 100644 meta-arago-extras/recipes-devtools/stress/files/texinfo.patch
 delete mode 100644 meta-arago-extras/recipes-devtools/stress/stress_1.0.4.bb
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool/avoid_parallel_tests.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool/ethtool-uint.patch
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool/run-ptest
 delete mode 100644 meta-arago-extras/recipes-extended/ethtool/ethtool_3.16.bb
 delete mode 100644 meta-arago-extras/recipes-extended/smcroute/smcroute_2.0.0.bb
 delete mode 100644 meta-arago-extras/recipes-support/boost/boost_%.bbappend
 delete mode 100644 meta-arago-extras/recipes-support/strongswan/files/fix-funtion-parameter.patch
 delete mode 100644 meta-arago-extras/recipes-support/strongswan/strongswan_5.3.2.bb
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/configure.ac-add-option-enable-thread-tls-to-manage-.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/configure.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/dbifix.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/fix-config-libnet.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/initscript
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/logwriter-dont-allocate-a-new-buffer.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/rewrite-expr-grammar.ym-Free-up-token.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/still-free-the-unconsumed-item.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/syslog-ng.conf
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/files/volatiles.03_syslog-ng
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/syslog-ng.inc
 delete mode 100644 meta-arago-extras/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb

-- 
2.2.0


