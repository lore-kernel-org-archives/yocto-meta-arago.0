Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.14293.1639175510934473986
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 10 Dec 2021 14:31:51 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id DE71640C86;
	Fri, 10 Dec 2021 22:31:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QzIG_HEkPMGt; Fri, 10 Dec 2021 22:31:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BBA9340C62;
	Fri, 10 Dec 2021 22:31:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id CA622174707;
	Fri, 10 Dec 2021 17:31:46 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: j-humphreys@ti.com,
	Denys Dmytriyenko <denys@konsulko.com>
Subject: [tisdk-build-scripts][PATCH 0/3] Build scripts simplification/cleanup pass #2
Date: Fri, 10 Dec 2021 17:31:34 -0500
Message-Id: <1639175497-11553-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4

From: Denys Dmytriyenko <denys@konsulko.com>

Second pass at simplification and cleanup of tisdk-build-scripts takes aim
at multi-machine build capabilities. Being able to build multiple machines
in parallel or sequentially is no longer relevant with the introduction of
Jenkins CI build farm.

This is the second and last of the major cleanup passes that preserves known
existing use cases and keeps the API compatible. Further changes would require
adjusting the way config files are modified and build script gets called from
the build farm.

Denys Dmytriyenko (3):
  build-oesdk.sh,lib/: remove support for multi-machine builds
  configs: cleanup config files due to removed functionality
  build-oesdk.sh: allow overwriting machine on command line

 build-oesdk.sh                       | 161 ++++++--------------
 configs/farm/arago-dunfell-next.txt  | 281 +----------------------------------
 configs/farm/arago-dunfell.txt       | 281 +----------------------------------
 configs/farm/arago-master.txt        | 281 +----------------------------------
 configs/farm/distroless-dunfell.txt  | 136 ++---------------
 configs/farm/distroless-master.txt   | 136 ++---------------
 configs/farm/poky-dunfell.txt        | 136 ++---------------
 configs/farm/poky-master.txt         | 136 ++---------------
 lib/oesdk/bitbake-test-sdk-image     | 107 +++++--------
 lib/oesdk/config-build-env           |  34 +----
 lib/oesdk/machine-specific-functions |  68 ---------
 11 files changed, 148 insertions(+), 1609 deletions(-)
 delete mode 100644 lib/oesdk/machine-specific-functions

-- 
2.7.4

