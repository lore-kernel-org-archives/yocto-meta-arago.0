Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by arago-project.org (Postfix) with ESMTPS id C851152985
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 19:48:59 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so1017517wrp.10
	for <meta-arago@arago-project.org>;
	Mon, 19 Oct 2020 12:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4TRhGJ36PKrKR8z5N273YwGwjOWcshkeOURZeRUF/20=;
	b=FjpZfQ5BO51NdYhqzTCQ9Hgzfl6UcGVack6deI+h4WskXep1vl4GeJaNBb1E4MIAqd
	ucfW5S7EcmiwQQNidv4tX3cUCW8bYNQ0NlTJgE7TNKzrby4Gk80w46XYcGm54bJVDw5L
	pfF9zFbsTLx8VgPR4Z8xM5pV0bmMcRi1Y5h7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=4TRhGJ36PKrKR8z5N273YwGwjOWcshkeOURZeRUF/20=;
	b=cnG/cPzYJ12S1ja7C2fOyXdRoXQ9LEfwXW5mnvqUZUbIhg2/x7cdEmvdMkapHV+StC
	gb5AaNidxMjg2hrNJGTi/RXh2TlwSr9yY0Fe+0TaSrh/d5G61dbogYQroy97oQ1znBBH
	YnU+lkufSnbhS+JeO6JPT8n60Rdwtvoh8wlqjCJHa4NVKFLDA1caZXncg4qkDKaVmS0r
	r0ksVDNvqmkk288PT7LTxSuqbpajq7CcNdqaZJQrIm4Ry1G/pCYloUXF2w78lomzWfZc
	NTkB1i43xnhXWw9r+ycCJjTLwHCfYVVsAYn5ASwmDUwENzSUczBjtpYv02Xw6e16Qb3C
	ZPKg==
X-Gm-Message-State: AOAM533HbW9neBdN0U5wpiV+Q9/k5YCeXaJmk6xpLcE3NIBkvTwJ/vZh
	dg4js7AfgX/jMrUmNDdldSJGWvfxjaWrnw==
X-Google-Smtp-Source: ABdhPJxDALBb/yt6mxSK0bvuPv1mGhte1MqaBlDedzqaYuPjm3Zs/NmJ7JIWeuGo/0/4lxklZnp7yQ==
X-Received: by 2002:adf:f10e:: with SMTP id r14mr817960wro.337.1603136754917; 
	Mon, 19 Oct 2020 12:45:54 -0700 (PDT)
Received: from ar2.home.b5net.uk
	(cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
	by smtp.gmail.com with ESMTPSA id 32sm994880wro.31.2020.10.19.12.45.53
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 19 Oct 2020 12:45:54 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: meta-arago@arago-project.org
Date: Mon, 19 Oct 2020 20:45:49 +0100
Message-Id: <20201019194549.169360-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Subject: [PATCH v2] packagegroup-arago-sysvinit-boot: Skip recipe if sysvinit is not enabled
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
X-List-Received-Date: Mon, 19 Oct 2020 19:49:00 -0000
Content-Transfer-Encoding: 8bit

This change fixes the following error seen at parse time when the
meta-arago-distro layer is present but sysvinit is not in
DISTRO_FEATURES:

    ERROR: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb: Please ensure that your setting of VIRTUAL-RUNTIME_init_manager (sysvinit) matches the entries enabled in DISTRO_FEATURES
    ERROR: Failed to parse recipe: .../meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 .../packagegroups/packagegroup-arago-sysvinit-boot.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
index 2eb2d777..9f937343 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-sysvinit-boot.bb
@@ -1,3 +1,6 @@
+REQUIRED_DISTRO_FEATURES = "sysvinit"
+inherit features_check
+
 require recipes-core/packagegroups/packagegroup-core-boot.bb
 
 PR = "r0"
-- 
2.28.0


