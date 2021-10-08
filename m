Return-Path: <sinthu.raja@mistralsolutions.com>
Received: from egress-ip4b.ess.de.barracuda.com
	(egress-ip4b.ess.de.barracuda.com [18.185.115.208])
	by arago-project.org (Postfix) with ESMTPS id 3E3A852C3A
	for <meta-arago@arago-project.org>;
	Fri,  8 Oct 2021 08:07:00 +0000 (UTC)
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
	[209.85.215.200]) by
	mx-outbound46-181.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 08 Oct 2021 08:06:56 +0000
Received: by mail-pg1-f200.google.com with SMTP id
	q23-20020a6562570000b029023cbfb4fd73so1184173pgv.14
	for <meta-arago@arago-project.org>;
	Fri, 08 Oct 2021 01:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=G9zIfeJi/PunzQMQMPFAHXa/UP0e/Y7A87fwIczb+GA=;
	b=Gj/4S6ItjtfQ0TeReIEF+sMD+iaatefuVsaoGNFvsRaz4/eYh3RtORPEIsgnRsZ/oA
	RKKlr5ELz9w5byllRh5+gW5mjm+OzmhS0WtQt3K72Oq3UQwAU8o2USpFLeS6UtJKOM+i
	JkkHX/JQKKVNt+VRiGHbyu90cZQhVIUrBoBOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20210112;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=G9zIfeJi/PunzQMQMPFAHXa/UP0e/Y7A87fwIczb+GA=;
	b=fFDkO634y4FFhbXhBLxnSKXm1nQsPZW+MdPsnzjQBlQlGlRqv+5UaEmqHy4fUv93gP
	PCLww5FL+6a8Uvo/o6pJhfj99DO6i1cyLQCGwY1norpHIarC2s7YoRtF7E1nBy1ykKga
	buvTp3vrfhC2NQ8Y0CK1zPJWktqryMZQECGDTwSSIqk2fYNWq7ybZcr0eMD/DWVMlBo1
	3K5KyKj2nFBK4jCUYNZbOtGWRQABrlZqpPIz0HqhOU+hClhDduYhkBfTcwnY6oWXpzRM
	1RrG+kk1kO7XqUiss/dlRYJAxAvjw9hO9bhykzKudL7qSNmzo0YypZa1gPpNXDfQwyI0
	xXjQ==
X-Gm-Message-State: AOAM532cUdD7Y9qdJJF6hjXgGdrJny/DKtPC+SKFURmKBvJPBwvsq6uW
	HaA4/gU2cXweZoOhU/NalkPMb0vmzBSXrG6Osfl8Fu0nI5IqOnxe2e7BazYqf5/mdOdPbsythVg
	Im9fhn9ItYVd7/lgPRHR3qy3GOIFEgCQ83v0fi0hBaKFC9qEDwSideH7EW9eO
X-Received: by 2002:a65:62c1:: with SMTP id m1mr3506511pgv.339.1633680415129; 
	Fri, 08 Oct 2021 01:06:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyk5sdm/WWD4dMi6Qx5IEFkNVnknldsUHsEgTMa2aOAS3pdHq89nk1N/dMBhD2QfgvXMhGzTA==
X-Received: by 2002:a65:62c1:: with SMTP id m1mr3506495pgv.339.1633680414874; 
	Fri, 08 Oct 2021 01:06:54 -0700 (PDT)
Received: from LAP568U.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id t2sm10393328pjf.1.2021.10.08.01.06.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 08 Oct 2021 01:06:54 -0700 (PDT)
From: Sinthu Raja <sinthu.raja@mistralsolutions.com>
X-Google-Original-From: Sinthu Raja <sinthu.raja@ti.com>
To: meta-arago@arago-project.org
Date: Fri,  8 Oct 2021 13:36:31 +0530
Message-Id: <20211008080632.22629-2-sinthu.raja@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211008080632.22629-1-sinthu.raja@ti.com>
References: <20211008080632.22629-1-sinthu.raja@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1633680416-311957-5450-2606-1
X-BESS-VER: 2019.1_20211006.2200
X-BESS-Apparent-Source-IP: 209.85.215.200
X-BESS-BRTS-Status: 1
Cc: Sinthu Raja <sinthu.raja@ti.com>
Subject: [dunfell/master][PATCH V2 1/2] packagegroups: tisdk-connectivity: package intel-9260 linux firmware images
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
X-List-Received-Date: Fri, 08 Oct 2021 08:07:01 -0000
Content-Transfer-Encoding: 8bit

From: Sinthu Raja <sinthu.raja@ti.com>

Package linux-firmware-iwlwifi-9260 and linux-firmware-ibt-18 containing
firmware for Intel 9260 (WLAN and BT)

Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 1eb0e072..98a1dacf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install wireless packages into the target FS"
 LICENSE = "MIT"
-PR = "r41"
+PR = "r42"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -18,6 +18,7 @@ WLAN_COMMON = "\
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
+    linux-firmware-iwlwifi-9260 \
 "
 
 WLAN_TI = "\
@@ -42,6 +43,7 @@ BT_COMMON = "\
     pulseaudio-module-bluez5-discover \
     pulseaudio-lib-bluez5-util \
     sbc \
+    linux-firmware-ibt-18 \
 "
 
 BT_TI = "\
-- 
2.31.1


