Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by arago-project.org (Postfix) with ESMTPS id C1DB952A31
	for <meta-arago@arago-project.org>;
	Wed, 17 Mar 2021 09:52:10 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id w65so41167645oie.7
	for <meta-arago@arago-project.org>;
	Wed, 17 Mar 2021 02:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=a88scykn70uRSF4+KN9bHmpzPUw37JkmLKI8RCOogsA=;
	b=X68pfVCXUaKbqADnKW8nqI9TVKJZbiVs5rAua9yf9cNBKVsB8iN6yNWhH5q+DvUj5W
	Ihgvae4AbPWv1wf7YZvjkL4l6NyCZHm4sSdyynULHXK4zctSWeBCO56bGa4XfY56R6wc
	qMk4DxMaI0UMDvbl8+SdDNHpIEFtmByAqitF5AtnReXQWXh3q2lelKbsNKCP95GDiMJ5
	5rLA9TxLWZrkAnu1cBl/zjxUuw2a3hQokHrCJAKik2lU8vriF53HTgT/PNENlsgAht9P
	j0CiCajFffZYphmzkmf4zw5eV1ioCTO4GVzejgVAd56NlD2Y40DVZ1R2XWk2h9OKpbF0
	VlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=a88scykn70uRSF4+KN9bHmpzPUw37JkmLKI8RCOogsA=;
	b=OycjlxVPmexycq9cODdctrSjUPvE2ZA3MHqSFiYYRy3+YSsjT0YGlMmn7+utUB/kQP
	NBw+5Ft11y6oUr7IztbwEyk9JPBNPwg2QdpNaTgjJzbU3BI9l5jzyK4Ou1Ukzilbq9GI
	m2D1yIzP++MaUvFUOwC/yq7qc8PKEzsZyJ3Z7rWmInmMi92MsfO0hgmCnrb2xZpDTCWx
	G+ehKGh0FZzUt4OKd3qA8jKAsShlsAUEKVjgGlJQW7QTUdGW5DzuywPNz9DxfGjs8oIK
	q/RYXE0J2UZmGLJ+zS3e+Yw56QRzrufuQSZMr7pzaJ9Rk787Zq50j1wBI+XalBgWqnOu
	QokA==
X-Gm-Message-State: AOAM532UjrM0mztW2I1zwgBDksnPSDUiQWOBKXrk1z8ivZ2Zw5IFtRnV
	lPWyxdq+6UxdkOCeHFtI/lFyL5T+6o2ypA==
X-Google-Smtp-Source: ABdhPJxGSFTECmv/B9AAHZA7G3cxYxwikWdj2waUanG90yt3OteRSDPLgz/5ukS1dmRO7L8Zl8D+QQ==
X-Received: by 2002:a54:480b:: with SMTP id j11mr2166822oij.116.1615974746827; 
	Wed, 17 Mar 2021 02:52:26 -0700 (PDT)
Received: from localhost.localdomain ([24.170.5.142])
	by smtp.gmail.com with ESMTPSA id x3sm7886061oif.22.2021.03.17.02.52.26
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 17 Mar 2021 02:52:26 -0700 (PDT)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 17 Mar 2021 04:52:01 -0500
Message-Id: <20210317095201.7528-2-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210317095201.7528-1-hnagalla@gmail.com>
References: <20210317095201.7528-1-hnagalla@gmail.com>
Subject: [ 1/1] Move BT_TI (BT FW etc) to CONNECTIVITY_RDEPENDS, as it is needed across all platforms
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
X-List-Received-Date: Wed, 17 Mar 2021 09:52:11 -0000

Signed-off-by: Hari Nagalla <hnagalla@gmail.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 8a8189fe..5552096d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -64,20 +64,18 @@ CONNECTIVITY_RDEPENDS = " \
     ${WLAN_COMMON} \
     ${WLAN_TI} \
     ${BT_COMMON} \
+    ${BT_TI} \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti33x = "\
-    ${BT_TI} \
     ${DEMO_APPS} \
 "
 
 CONNECTIVITY_RDEPENDS_append_ti43x = "\
-    ${BT_TI} \
     ${DEMO_APPS} \
 "
 
 CONNECTIVITY_RDEPENDS_append_dra7xx = "\
-    ${BT_TI} \
 "
 
 RDEPENDS_${PN} = "\
-- 
2.17.1


