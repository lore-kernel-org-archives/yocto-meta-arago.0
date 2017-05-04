Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 786755299D
	for <meta-arago@arago-project.org>;
	Thu,  4 May 2017 15:25:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 6A1D220BEA;
	Thu,  4 May 2017 15:25:39 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id xQoNgz5KNzpQ; Thu,  4 May 2017 15:25:39 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 46B6C20BE6;
	Thu,  4 May 2017 15:25:38 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 9C279162493;
	Thu,  4 May 2017 11:25:37 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  4 May 2017 11:25:32 -0400
Message-Id: <1493911533-127779-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1493911533-127779-1-git-send-email-denis@denix.org>
References: <1493911533-127779-1-git-send-email-denis@denix.org>
Subject: [oe-layersetup][PATCH 2/3] distroless-master-config: rename from distroless-meta-ti
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
X-List-Received-Date: Thu, 04 May 2017 15:25:45 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/{distroless-meta-ti-config.txt => distroless-master-config.txt} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename configs/{distroless-meta-ti-config.txt => distroless-master-config.txt} (100%)

diff --git a/configs/distroless-meta-ti-config.txt b/configs/distroless-master-config.txt
similarity index 100%
rename from configs/distroless-meta-ti-config.txt
rename to configs/distroless-master-config.txt
-- 
2.7.4


