Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web08.19752.1644223418906116646
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 07 Feb 2022 00:43:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20210112.gappssmtp.com header.s=20210112 header.b=P49n5xiW;
 spf=pass (domain: baylibre.com, ip: 209.85.221.44, mailfrom: clabbe@baylibre.com)
Received: by mail-wr1-f44.google.com with SMTP id k1so6808161wrd.8
        for <meta-arago@lists.yoctoproject.org>; Mon, 07 Feb 2022 00:43:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoF7r4SxPzpU43Cfyr6RcETU4jfD11HfTCpD5hhlSTA=;
        b=P49n5xiWOBkjoBBsbxruy7m/7IS5Pj2ZZT76kKUITAyHawkEyJYBR0A/tI6v/ro6VZ
         D6OV/VZXdAoTSU6RvHVy0kcDN++OLcwQmGEzntlvfC2K1rQSICVf2b9La5/1Y26Wgy/4
         0tsw3h+ei8EMoWI6Dv7xDJRpA2CB2yVnlWQ57k8z7Ihqbf6021N6NLozbUKzejYh/7oQ
         5B4BSOGn7hHONES1hWuIasRYe9Le1j8Z92L/SQgngxaBtpMclTRRV0m1ecBG/27mnbxx
         agDGpYax3lqAFk22ZrpSqHfZTagMPKfsIYnvsQX445QwVNi2Ex8ccik8qWyAqcC09gUH
         ZQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hoF7r4SxPzpU43Cfyr6RcETU4jfD11HfTCpD5hhlSTA=;
        b=yQPIicmuW/XOFaChL2iKaMWMGgk4yK+PDkMjBSB04kIQVYoL6Y0FsdRKUs7WdtHUOy
         jOWUmkgdaBsqR5F3hUNalZFNFVsksAVNDbaXNJT2NExwVnjqipqLBiApTXNwIAGRVuGz
         ISNbDnp3ulEcl1TfBaa0sZjTiWwguFo2MNd5MtzXGXwQGADwJn0GaOooPFobQmL7ZrbU
         4IEjZe1mo1DRyw6GfJXgeApnrHirRZRjzoGuseLaFuRysiM1zPFHzBZSXQU+c51xrbB8
         hLQZxgryhQmKOiksJGdQrXrCObksgtdYkGx2tuYKMx5sPQ+0gvCYKa9k2Kanqc1JfCCe
         hDTg==
X-Gm-Message-State: AOAM533KKDIwJiSPC04msDShP9tRw7F447daA6DzXsLyx3JUCmb0Dp6e
	D+b5CuK2VoxIWIlLs3VR6yhLwqK7Hx15xg==
X-Google-Smtp-Source: ABdhPJyjVlMz0dj3gacC+KPv04mG63XX+39czjYS+5IZdMcX9an4dJBSTNBmBF9f+xX4YFMC9MTm6A==
X-Received: by 2002:a5d:6d85:: with SMTP id l5mr6455851wrs.129.1644223416730;
        Mon, 07 Feb 2022 00:43:36 -0800 (PST)
Return-Path: <clabbe@baylibre.com>
Received: from localhost.localdomain (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id x11sm2935367wmi.37.2022.02.07.00.43.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 00:43:36 -0800 (PST)
From: "Corentin Labbe" <clabbe@baylibre.com>
To: meta-arago@lists.yoctoproject.org
Cc: khilman@baylibre.com,
	Corentin Labbe <clabbe@baylibre.com>
Subject: [EXTERNAL,dunfell PATCH v2] Use crypto_apps_script instead of crypto_apps_program
Date: Mon,  7 Feb 2022 08:43:31 +0000
Message-Id: <20220207084331.4147148-1-clabbe@baylibre.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Corentin Labbe <clabbe@baylibre.com>

crypto_apps_program depended on ti-crypto-examples which is disabled since 2 years now.
So let's fallback to original crypto_apps_script

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

