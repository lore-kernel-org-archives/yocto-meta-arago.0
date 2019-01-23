Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 94130529D5
	for <meta-arago@arago-project.org>;
	Wed, 23 Jan 2019 04:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 51AB84096B;
	Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vJS0ytwBHsNu; Wed, 23 Jan 2019 04:52:14 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id BEA6740AB7;
	Wed, 23 Jan 2019 04:52:12 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E1186169B35;
	Tue, 22 Jan 2019 23:52:09 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 22 Jan 2019 23:52:02 -0500
Message-Id: <1548219129-12459-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1548219129-12459-1-git-send-email-denis@denix.org>
References: <1548219129-12459-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 2/9] gstreamer1.0-plugins-bad: update bbappend to 1.14.4
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
X-List-Received-Date: Wed, 23 Jan 2019 04:52:28 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...ugins-bad_1.14.2.bbappend => gstreamer1.0-plugins-bad_1.14.4.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.14.2.bbappend => gstreamer1.0-plugins-bad_1.14.4.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
similarity index 100%
rename from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.2.bbappend
rename to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.14.4.bbappend
-- 
2.7.4


