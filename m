Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pl0-f67.google.com (mail-pl0-f67.google.com
	[209.85.160.67])
	by arago-project.org (Postfix) with ESMTPS id 798DF52A39
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 09:22:56 +0000 (UTC)
Received: by mail-pl0-f67.google.com with SMTP id j8-v6so6798015pll.12
	for <meta-arago@arago-project.org>;
	Mon, 20 Aug 2018 02:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=qy6rpy2Mt2QlncRbxPhWO4CrZitq3zmlqYSJj2seYzM=;
	b=EtNZ5IyRNLyqzkmuiwJoAr2df0jawPqY1yF0/asawAAAKCYB0uDkHS2RP2wvTtN0Qt
	9ajqM4XMWQPYY1Jxb6Somr38YD/NHRyRojTwJ0jUw3HrE6uZCT8N9VzszcKFPqyvlY2C
	tDvzubjMnJDSKtbEAn692ZoG+7iVYjs4iIy1q6VWlFa2YLm0xbd8iG+6Yxwm2FoUL7Nm
	Mo1Eavt4TAIH6PrXyeVjiewpDZxpy9LAOnZqMYy0g9fxy+N+O7QcZvbE0eOCJiCdnS/0
	5do4z7sHs5Xe4aIHXkbUlfSBNixLazJL+AR2Gi53WmoGc2KchAOPcmdps3/ddAS+CFa7
	vPwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=qy6rpy2Mt2QlncRbxPhWO4CrZitq3zmlqYSJj2seYzM=;
	b=cRJ5lmxFttvt6WMP5H4SmfcgXLjbhBlSXr4zL9dXCFDioBPBgtzlpVUyY54wX4erMA
	5wk2Uo8c3S78zxmcnqHKD1MhdHjge/JDC7wJKhYmwq6CQP4oEXXcWtugncAGlv3ZdokR
	ablDJkpVq2CVROm+2lgmETe3qb8j0uAkTiFZ9dqCbX8lqMuEUA30jcl7rDlCGByGAheL
	zabZGGs90om8Tr1tm6xBy6auR5ZaQtV8XELFutQpwEcItFbFFLE4DS43xLA19NKZr9Oy
	+XFLf/ljWbo0wNvFk6ja6rc+7YIiCUYNuEx3EWYcG+16iOKU6vDxhF9cwV6U/MqfhRoy
	TPFA==
X-Gm-Message-State: AOUpUlEVWXlJZKoRXsfxBl5VzNxp8T8HO1IGDL4bYg2Cw5KWaq7nlb+y
	xdSlVvg3LGF45G2hYUv39KjON94B
X-Google-Smtp-Source: AA+uWPzdES8DArc6/igH35q2Soix6iDfiLDriWahWEs3Ih7zxTUD+kzWeSiacYgC9cHVO5kgL82DGA==
X-Received: by 2002:a17:902:8ec8:: with SMTP id
	x8-v6mr44127490plo.308.1534756968321; 
	Mon, 20 Aug 2018 02:22:48 -0700 (PDT)
Received: from localhost.localdomain (163-47-106-116.flip.co.nz.
	[163.47.106.116]) by smtp.gmail.com with ESMTPSA id
	q127-v6sm5269596pgq.11.2018.08.20.02.22.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 20 Aug 2018 02:22:47 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 20 Aug 2018 21:22:27 +1200
Message-Id: <1534756947-24631-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [rocko/sumo/master/][PATCH] meta-toolchain-arago-qte: fix TOOLCHAIN_TARGET_TASK
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
X-List-Received-Date: Mon, 20 Aug 2018 09:22:57 -0000

Resolves following error when building meta-toolchain-arago-qte
ERROR: Nothing RPROVIDES 'packagegroup-arago-qt5-toolchain-target'


Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
index fdca2c3..0e0e057 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago-qte.bb
@@ -1,6 +1,6 @@
 # Qt Embedded toolchain
 TOOLCHAIN_HOST_TASK ?= "nativesdk-packagegroup-arago-qte-toolchain-host"
-TOOLCHAIN_TARGET_TASK ?= "${@base_conditional('QT_PROVIDER', 'qt5', 'packagegroup-arago-qt5-toolchain-target', 'packagegroup-arago-qte-toolchain-target', d)}"
+TOOLCHAIN_TARGET_TASK ?= "packagegroup-arago-qte-toolchain-target"
 TOOLCHAIN_SUFFIX ?= "-qte-sdk"
 
 require meta-toolchain-arago.bb
-- 
2.7.4


