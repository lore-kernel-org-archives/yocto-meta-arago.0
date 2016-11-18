Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 01CD8529C6
	for <meta-arago@arago-project.org>;
	Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B67FC20AF9;
	Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5ylp6oWReont; Fri, 18 Nov 2016 22:09:53 +0000 (UTC)
Received: from gandalf.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 77EEA204AF;
	Fri, 18 Nov 2016 22:09:52 +0000 (UTC)
Received: from sam.denix (sam [192.168.0.5])
	by gandalf.denix.org (Postfix) with ESMTP id 9636716219D;
	Fri, 18 Nov 2016 17:09:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Fri, 18 Nov 2016 17:09:42 -0500
Message-Id: <1479506990-10407-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/8] Toolchain-related fixes
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
X-List-Received-Date: Fri, 18 Nov 2016 22:09:54 -0000

From: Denys Dmytriyenko <denys@ti.com>

Series of toolchain-related fixes to pass the correct CC variable to the build,
instead of relying on the project's Makefile to set one up. This takes care of
using the right cross-compiler with all the required options, e.g. --sysroot,
and ensures correct builds with either external, or internal toolchain.

This has been developed and tested against master, but should also be applicable
to krogoth as well.

Denys Dmytriyenko (8):
  arm-benchmarks: fix build with any toolchain, pass CC var
  switch-config: fix build with any toolchain, pass CC var
  wlconf: fix build with any toolchain by using proper CC var
  am-sysinfo: fix build with any toolchain, pass CC var
  cpuloadgen: fix build with any toolchain, pass CC var
  eventdump: fix build with any toolchain, pass CC var
  omapconf: fix build with any toolchain, pass CC var
  screenshot: fix build with any toolchain, pass CC var

 .../recipes-benchmark/arm-benchmarks/arm-benchmarks_1.3.bb        | 8 +++-----
 meta-arago-extras/recipes-bsp/switch-config/switch-config_git.bb  | 4 ++--
 meta-arago-extras/recipes-connectivity/wlconf/wlconf.bb           | 4 ++--
 meta-arago-extras/recipes-core/am-sysinfo/am-sysinfo_git.bb       | 7 +++----
 meta-arago-extras/recipes-devtools/cpuloadgen/cpuloadgen_git.bb   | 4 ++--
 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb     | 6 +++---
 meta-arago-extras/recipes-devtools/omapconf/omapconf_git.bb       | 6 +++---
 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb   | 6 +++---
 8 files changed, 21 insertions(+), 24 deletions(-)

-- 
2.7.4


