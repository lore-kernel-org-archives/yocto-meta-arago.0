Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6E37852993
	for <meta-arago@arago-project.org>;
	Thu,  9 Aug 2018 02:01:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 133B920C5B;
	Thu,  9 Aug 2018 02:01:00 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 4c_U4lKKw74M; Thu,  9 Aug 2018 02:00:59 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D111820C59;
	Thu,  9 Aug 2018 02:00:58 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 22C3416357A;
	Wed,  8 Aug 2018 22:00:58 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  8 Aug 2018 22:00:43 -0400
Message-Id: <1533780054-50159-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1533780054-50159-1-git-send-email-denys@ti.com>
References: <1533780054-50159-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 03/14] gstreamer1.0-plugins-bad: 1.12.4 -> 1.14.1
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
X-List-Received-Date: Thu, 09 Aug 2018 02:01:08 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ugins-bad_1.12.4.bbappend => gstreamer1.0-plugins-bad_1.14.1.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.12.4.bbappend => gstreamer1.0-plugins-bad_1.14.1.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.12.4.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.1.bbappend
-- 
2.7.4


