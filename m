Return-Path: <x0038811@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 5DF30529BD
	for <meta-arago@arago-project.org>;
	Thu, 22 Mar 2018 04:06:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2M46rag025500
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521691613;
	bh=KRAx2pwySsRC77OyNpLvHNH5vV0wqsBM6DgrAgAigdI=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=UypaIwe+XXIA3eqavcNW/jKDWXPdg/6kTCmVN/oo+J5z4H44BKPt7MgZYVNv8gaQf
	fw+MQbJAtnUgK3ua9udRpdtVgOi5BxbCD+texepnJ3e3vjpfbKBjbN3PBARlmtG6m9
	kyy5DKnzHksH2A5olrfBzaGQ05Pust7h9d1ravlY=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46rL7014188
	for <meta-arago@arago-project.org>; Wed, 21 Mar 2018 23:06:53 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Wed, 21 Mar 2018 23:06:53 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Wed, 21 Mar 2018 23:06:53 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2M46nAM028035;
	Wed, 21 Mar 2018 23:06:52 -0500
From: Ramprasad N <x0038811@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Mar 2018 09:36:38 +0530
Message-ID: <1521691605-49259-3-git-send-email-x0038811@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521691605-49259-1-git-send-email-x0038811@ti.com>
References: <1521691605-49259-1-git-send-email-x0038811@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko 2/9] gstreamer1.0*-good: Increase v4l2src minimum buffers by 4
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
X-List-Received-Date: Thu, 22 Mar 2018 04:06:56 -0000
Content-Type: text/plain

Signed-off-by: Ramprasad N <x0038811@ti.com>
---
 ...gins-good_1.8.3.bbappend => gstreamer1.0-plugins-good_1.12.2.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 copy meta-arago-extras/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.8.3.bbappend => gstreamer1.0-plugins-good_1.12.2.bbappend} (100%)

diff --git a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bbappend
similarity index 100%
copy from meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.8.3.bbappend
copy to meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-good_1.12.2.bbappend
-- 
1.9.1


