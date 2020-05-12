Return-Path: <pbarker@konsulko.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by arago-project.org (Postfix) with ESMTPS id AF13B52A8A
	for <meta-arago@arago-project.org>;
	Tue, 12 May 2020 17:44:24 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id y3so16639414wrt.1
	for <meta-arago@arago-project.org>;
	Tue, 12 May 2020 10:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I+Ofs2S494WUcepdBVoWK8aBzYwwfkZR6Er72d/o1AQ=;
	b=qy8Kg3wfWkSTDAKbAxzk36uQhZe0zdgjHS7Z1U++hlkHVV+WOxnx7Fi0Xp/GIEttez
	pIyDx8tP3xnvCEyxWOR8cz6BQ9h89ueb16wyza0KTAD+dAiTsqYgEllwbRjw/LPGpNHb
	UQNcNszur0EIJh0SinaeNgOgw0bJwWJ1HH6rM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=I+Ofs2S494WUcepdBVoWK8aBzYwwfkZR6Er72d/o1AQ=;
	b=GS+Eph4I7mWGCMKKXsnzeuXsf/czBAyTRv4i43aUT7FDAym2x22cT8xTTFdT1kjG9m
	7MdPEN+ByKGlGASdiurxu3qbB7uNyA7FWn+/g645PeqIgFlsGva09VjtKiWiwUU8uYc2
	35gq4COO+HS+RkZiF+eTeRF367V1HY9PtEat8W8JtvJkpvfUDOuBQ8yS26+RA0vgGtD3
	3lMHkxH3yhQ0lozgT4oMVFTQs426idB47HbnzoNT3JnBndNiZ2730o7u2/ehO+byXRBm
	NU7Q11TFomHXHfOJjlbd+dN2ten4UEFDUj8zOuXZS+8momKyyhWNFSrlv4tRw8dmDaV/
	G4jg==
X-Gm-Message-State: AGi0PubOFdKJ+POR0hQRT2ZNir2Mf4dasidq90OgRcWV6jUmklyXBSLA
	NRXvns7SkZwsjW2MOcnZ8AjiLsBmP8l8fA==
X-Google-Smtp-Source: APiQypIKyUosatRvMSjYIqYfBbp/1cOgeczkLptPKWcFJmN2JjrsttSYG7sTZ2QdSSFU9Izge0DhGQ==
X-Received: by 2002:adf:e64c:: with SMTP id b12mr25598960wrn.131.1589305319125;
	Tue, 12 May 2020 10:41:59 -0700 (PDT)
Received: from ar2.home.b5net.uk ([213.48.11.149])
	by smtp.gmail.com with ESMTPSA id
	j2sm24121843wrp.47.2020.05.12.10.41.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 12 May 2020 10:41:58 -0700 (PDT)
From: Paul Barker <pbarker@konsulko.com>
To: meta-arago@arago-project.org
Date: Tue, 12 May 2020 18:41:50 +0100
Message-Id: <20200512174150.8377-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Subject: [PATCH] arago.conf: Allow TMPDIR path modification to be disabled
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
X-List-Received-Date: Tue, 12 May 2020 17:44:25 -0000
Content-Transfer-Encoding: 8bit

We define and use TCMODEAPPEND in the same way TCLIBCAPPEND is defined
and used in oe-core. This allows the modification of the TMPDIR path to
be disabled where needed.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta-arago-distro/conf/distro/arago.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 84251d76..6ea41989 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -72,7 +72,8 @@ INITRAMFS_FSTYPES_k2l-hs-evm = "cpio.gz"
 # Mask any broken recipes (currently none)
 #BBMASK = ""
 
-TMPDIR .= "-${TCMODE}"
+TCMODEAPPEND ?= "-${TCMODE}"
+TMPDIR .= "${TCMODEAPPEND}"
 
 LIBC_DEPENDENCIES_remove = "glibc-gconv-cp1252 glibc-gconv-ibm850 glibc-gconv-iso8859-1 glibc-gconv-iso8859-15 glibc-localedata-i18n"
 
-- 
2.26.2


