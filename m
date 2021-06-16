Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3B7A552B57
	for <meta-arago@arago-project.org>;
	Wed, 16 Jun 2021 20:13:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 4C11F40C32;
	Wed, 16 Jun 2021 20:14:19 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id mHyAWVzy1Vwu; Wed, 16 Jun 2021 20:14:19 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 3217240C1C;
	Wed, 16 Jun 2021 20:14:18 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id F3ADC1745F1;
	Wed, 16 Jun 2021 16:14:16 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 16 Jun 2021 16:14:07 -0400
Message-Id: <1623874449-31873-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [PATCH 0/2] RFC: Add global Docker container runtime
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
X-List-Received-Date: Wed, 16 Jun 2021 20:13:42 -0000

From: Denys Dmytriyenko <denys@konsulko.com>

This patchset adds Docker container runtime to both base and default rootfs 
images for all platforms.

Patch 1 enables necessary kernel configs through docker.cfg config fragment. 
This fragment can later be added to ti-linux-kernel/ti_config_fragments.

Denys Dmytriyenko (2):
  linux-ti-staging: enable necessary configs for running docker
    containers
  packagegroup-arago-base: add docker runtime to the base and default
    rootfs

 .../packagegroups/packagegroup-arago-base.bb         |  1 +
 meta-arago-distro/recipes-kernel/linux/docker.inc    |  2 ++
 .../linux/linux-ti-staging-rt_%.bbappend             |  1 +
 .../linux/linux-ti-staging-systest_%.bbappend        |  1 +
 .../recipes-kernel/linux/linux-ti-staging/docker.cfg | 20 ++++++++++++++++++++
 .../recipes-kernel/linux/linux-ti-staging_%.bbappend |  1 +
 6 files changed, 26 insertions(+)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/docker.inc
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-ti-staging/docker.cfg

-- 
2.7.4


