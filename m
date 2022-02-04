Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.web12.9252.1643982482036150671
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 05:48:02 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=hPZwWyz/;
 spf=pass (domain: baylibre.com, ip: 209.85.128.46, mailfrom: clabbe@baylibre.com)
Received: by mail-wm1-f46.google.com with SMTP id n8so4538674wmk.3
        for <meta-arago@lists.yoctoproject.org>; Fri, 04 Feb 2022 05:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kp5NKV58QgnaXJzTlWUsE8ZbwRRkEeaMUselT9GMmXI=;
        b=hPZwWyz/aIYNbdYsxrGYcBU3r8SoTXFXHO3LL605uk1EFilgbZNcltJuWpowLrXrhL
         Ihh2dk/K1VjN6EStj553PMhyW9mP7oVlWtA+iZONuL9kSjQGsXpWayFZSGGn+i4Wkw+2
         nUM5frMtYv8F+R+JxWBVY+mgUZ6db6/u55Ht4srLR9c7IneuFVP2zn5KarDqTNS2W31j
         yiwG7C20ePX7qtpoVY/rb6Ltn1enh/GVax41LgzXJjz/VLXqHIeVPnMBlEikdFtuUzBQ
         /DAAEjukIVcIo3BO4xb81twXi7VIkEfgcQSzBc7vcCr091klopvdrHEcxyMR3OcKBpjr
         7F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kp5NKV58QgnaXJzTlWUsE8ZbwRRkEeaMUselT9GMmXI=;
        b=YZROXWu4IMaMUobkGobXZb6g0m6aIwyd1K9hLT4+1YKEgs0c5rlzlCmf9ap25PIKIc
         PHpKdeX/aTnX9dwdma6V5RuWT2+ZA2bNPZg6lcwpb/U8+BQpMyfFZzvQ6JQkvp9ztoim
         gaJrmD0XUGmEminWu1MKuLK3Nd6epSwpgYCgNUMC7rWDz5aVsPbElfbak7ifhnlanioO
         Ay+D9D3OxMjw/19Dlv/8YJ3yO6N98C1nIb8qYVPK49kTdNBXkxjvfd8NGqrC8q8Blobf
         lrBuO4q755DzL5DJ87rqsMAqlzS1pCwUX8hieTsqJbT/1OtrZhb5VcQVE9JeTo2Xcx0/
         kxyg==
X-Gm-Message-State: AOAM532bqj3pHypm0I2YzWZjzabRvDRcaTzvkJf+f1hANIPD7mBNMnjC
	SLZK1i53fNogwxnWovK5SsVESB/umkIb3g==
X-Google-Smtp-Source: ABdhPJxjOh8JQxauaLAuQZprjg9MHNHpxk8SJD7yZiRdjp7F4EhG+cYNNq474AspwGwaGFcMLDJLTw==
X-Received: by 2002:a05:600c:27ca:: with SMTP id l10mr2354308wmb.105.1643982480214;
        Fri, 04 Feb 2022 05:48:00 -0800 (PST)
Return-Path: <clabbe@baylibre.com>
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id o14sm2253486wry.104.2022.02.04.05.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 05:47:59 -0800 (PST)
From: "Corentin Labbe" <clabbe@baylibre.com>
To: meta-arago@lists.yoctoproject.org
Cc: khilman@baylibre.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [EXTERNAL,dunfell PATCH] Use crypto_apps_script instead of crypto_apps_program
Date: Fri,  4 Feb 2022 13:47:53 +0000
Message-Id: <20220204134753.2119251-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corentin Labbe <clabbe@baylibre.com>

crypto_apps_program depended on ti-crypto-examples which is disabled since 2 years now.
So let's fallback to original crypto_apps_script

close: LCPD-24598

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
Signed-off-by: Corentin LABBE <clabbe@baylibre.com>
---
 .../recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb   | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
index 7029df53..8afd79c7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-crypto-demos_2.0.bb
@@ -7,17 +7,8 @@ PR = "${INC_PR}.12"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 S = "${WORKDIR}/git/cryptos_apps_scripts"
-S_ti33x = "${WORKDIR}/git/cryptos_apps_program"
-S_ti43x = "${WORKDIR}/git/cryptos_apps_program"
-S_dra7xx = "${WORKDIR}/git/cryptos_apps_program"
-S_keystone = "${WORKDIR}/git/cryptos_apps_program"
 
 FILES_${PN} += "${MATRIX_BASE_DIR}/*"
 
 # Make sure crypto submenu and app images has been installed. Also make sure openssl is available
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-cryptos openssl matrix-gui-helper-scripts"
-
-#RDEPENDS_${PN}_append_ti33x = " ti-crypto-examples"
-#RDEPENDS_${PN}_append_ti43x = " ti-crypto-examples"
-#RDEPENDS_${PN}_append_dra7xx = " ti-crypto-examples"
-#RDEPENDS_${PN}_append_keystone = " ti-crypto-examples"
-- 
2.25.1

