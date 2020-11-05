Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by arago-project.org (Postfix) with ESMTPS id 6FAAC52985
	for <meta-arago@arago-project.org>;
	Thu,  5 Nov 2020 10:41:55 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id g12so1137640wrp.10
	for <meta-arago@arago-project.org>;
	Thu, 05 Nov 2020 02:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ms4RZr1Tsab42FbVhR+02OLDsvhbwvq8DFhd8Ytdt4M=;
	b=OuI5G1u0zj55+ksKE/xKsF/W2dwnvkVJyJyT/L5w4gY0WGVJ8+fJy9WEyJLzzpcAxd
	A85YCbeGXhVOVK35SXPZ55kUBh2/YsSEabnFbTt5vbcY+rnxtwox+6GPUt2QDLyG+/1J
	cYEFnCFgJCLbJSMdGodF61aYQjUj6mnQfg/5g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ms4RZr1Tsab42FbVhR+02OLDsvhbwvq8DFhd8Ytdt4M=;
	b=CG7XdcxXyL5K06OYCJppjQNU8SP4PEN386EPRVgKBPfn+JGhBNZm55Bp9Q8mwMn29Y
	GscWpjvQtFjUy/1LdIkBCmwiGnAoM7CY0O3YlQkEzDwK0FXo1VWgcS+3Y4+b10EPxff9
	+/gUac0vaMyReubE7yUkIEKPUSKp3RKOa0HUddmilfpiT8UlUS8oLlA68ukrIz2Aw7Fo
	Y5i6a91cxkuXTOqXGKayRkWHifIizb4LU4oM2oPm26znXVElxq2pEYkcXUmPx3MJOZWA
	UC8YqeQwsMddWrMxg0a9yq4B8/KA00z5FF6KgEP4el6LJ8j3LSA3+v8Wte1TXJTXmBzx
	dEng==
X-Gm-Message-State: AOAM532NmKcia0ddLtK1I+ZcQr0X9W2b3AUrqsI8Ge3SoeSfU0mDlE7T
	fIeqb7DdD1cuNFjPcsp3jVkyZFRBtUkzyQ==
X-Google-Smtp-Source: ABdhPJxKk5UsfcjTnLtJMB/VaCYl9VKxzbcS/pEQAwMMe27psubSEAb+U9//lKcCd0sSZTWQ00buNw==
X-Received: by 2002:adf:8bcc:: with SMTP id w12mr2283269wra.157.1604572725976; 
	Thu, 05 Nov 2020 02:38:45 -0800 (PST)
Received: from alpha.home.b5net.uk
	(cpc76132-clif11-2-0-cust249.12-4.cable.virginm.net. [80.7.160.250])
	by smtp.gmail.com with ESMTPSA id h8sm1787217wro.14.2020.11.05.02.38.45
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Nov 2020 02:38:45 -0800 (PST)
From: Paul Barker <pbarker@konsulko.com>
To: meta-arago@arago-project.org
Date: Thu,  5 Nov 2020 10:38:16 +0000
Message-Id: <20201105103816.2865115-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Subject: [master/dunfell PATCH] matrix-gui-pm-demos: Allow empty package
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
X-List-Received-Date: Thu, 05 Nov 2020 10:41:55 -0000
Content-Transfer-Encoding: 8bit

The matrix-gui-pm-demos recipe splits its binaries into several
subpackages leaving the default package empty. The dependencies for the
default package are set so it makes sense to allow this empty package to
be created.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
index 0116f5ea..a9ebb84f 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-pm-demos_2.0.bb
@@ -10,6 +10,7 @@ S = "${WORKDIR}/git/power_apps"
 
 # Make sure power submenu and app images has been installed
 RDEPENDS_${PN} += "matrix-gui-apps-images matrix-gui-submenus-power matrix-gui-generic-pm"
+ALLOW_EMPTY_${PN} = "1"
 
 # Break out the individual files into separate packages.  That way only the
 # PM features supported for each device can be installed.  Prepend the list
-- 
2.29.0


