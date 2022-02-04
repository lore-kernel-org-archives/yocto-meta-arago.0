Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web09.6981.1643967102817484079
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 04 Feb 2022 01:31:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=BXC2L0G+;
 spf=pass (domain: baylibre.com, ip: 209.85.221.53, mailfrom: clabbe@baylibre.com)
Received: by mail-wr1-f53.google.com with SMTP id s18so10130063wrv.7
        for <meta-arago@lists.yoctoproject.org>; Fri, 04 Feb 2022 01:31:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kp5NKV58QgnaXJzTlWUsE8ZbwRRkEeaMUselT9GMmXI=;
        b=BXC2L0G+OIzTZxMb8wVO69dGVYfRYx6OUb+ac7f6fvTJp/N/NLJvfm3pkvGivatV4B
         Q0A9k7a9rO2og5mUiYeL1Fjin6WUNvReSOZDsRA3pdbFPLszg8LslIWuqvGgdx1NyLIu
         s/c/AYXxf2DYXH65lUwI5dcB+jSyPghp89MfSO+tqO8CHF8LfFnav38nb+AxSgXNU0hb
         V3wUwwKmCoyUOyUQ4dmRAIJUt2hhZMDCj7dCLHkm6KvCtGJHYaZvttcbgmiweGPVjgyn
         zfeVmoCyNVTLVYqNIXZhjuWTY9MvyK8cK1uOhdmRk5OsYvEF7xUzbNbcg1Tzsw6KYfzc
         VaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Kp5NKV58QgnaXJzTlWUsE8ZbwRRkEeaMUselT9GMmXI=;
        b=xGRm1hxAdRhQOYIB1KzyzC5GFR8Ni3pGLypoty3sAEc4ISrRjJYTZcmRsf9u11SjlN
         K6Gt3J+wlYXWr7KnwrFymQcSK16FXkXQ0480IIEe2MsqqlogM1WvkAgfung0zJc3OWLi
         IES0ZyUizppiYrZ8IcdNdcI6yvyVmQKfH+YUD1AoJeR3Sbk5cEcq+yBAqrVOg6qET2hl
         T3fwUuiB2ZZ9ueNSdRn1YFqhDtRklsRX9I/zwwkgCU12ZT4VSi8Nj1A4pXlyJk7hqUx8
         J5IjBK7NQfiW5C22lYzRhKsUkQ9p9BTyeOLwy4kELmTYrfUH/Q11wkTTD0Iag9yAU/oZ
         9+iQ==
X-Gm-Message-State: AOAM533LXFrUhlWPrnFnSAMazGzt1qYIQYYdfbBJwFpInLhjCM1D3UH/
	F9B9YT3TaLUCSa93D8JXI5ejTzvX0FKi+w==
X-Google-Smtp-Source: ABdhPJye82i/+j4ghJJiJMqoUfLhlg6awLPkV3K5faflKrRCiy6BsQ/dsoQSBVQvAH02PiNAbCzM3w==
X-Received: by 2002:a5d:6c61:: with SMTP id r1mr1754363wrz.414.1643967101324;
        Fri, 04 Feb 2022 01:31:41 -0800 (PST)
Return-Path: <clabbe@baylibre.com>
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id p14sm1558725wrr.7.2022.02.04.01.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Feb 2022 01:31:40 -0800 (PST)
From: Corentin LABBE <clabbe@baylibre.com>
To: meta-arago@lists.yoctoproject.org
Cc: khilman@baylibre.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [EXTERNAL,dunfell PATCH] Use crypto_apps_script instead of crypto_apps_program
Date: Fri,  4 Feb 2022 09:31:18 +0000
Message-Id: <20220204093118.3724551-1-clabbe@baylibre.com>
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

