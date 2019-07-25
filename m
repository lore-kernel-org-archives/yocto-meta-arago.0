Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com
	[209.85.215.180])
	by arago-project.org (Postfix) with ESMTPS id 02CFC52975
	for <meta-arago@arago-project.org>;
	Thu, 25 Jul 2019 05:28:23 +0000 (UTC)
Received: by mail-pg1-f180.google.com with SMTP id o13so22380306pgp.12
	for <meta-arago@arago-project.org>;
	Wed, 24 Jul 2019 22:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=CJf16YXMkhTzZHs7hL9xjO9tlMlCB33SIn7Y0OlJbM4=;
	b=cAVgVqNFdBd2vZn2pWp0K+cGAhdCaI4rqeyUTY1xlPqv8BbaiYST2rrUmzHSSgo1zW
	mqdfq3edu6AGd+UD56/uR+rkjacy/fM6XL/fNd2cc0LCTsDYelGG0FOUlHMRa6ciIAGk
	X06EtWi3+KJ8vFZup11LpIzIcxC5lmLm5fnQR30mVkCk3jvD2+LHKvBRawajeAblx0wp
	Jsqlqy0SJYnATPybIFchzZR8bP7sQQsXI4UOY+aDkPppkQlQKs7xcfwcfdCZyuHypmUx
	jYRazwfR4sTHs6mNB8iHrVrO103cIGsVkIq2S1GIwKMRPHtX7NS68RfGR5pjpk4zRZw5
	cgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CJf16YXMkhTzZHs7hL9xjO9tlMlCB33SIn7Y0OlJbM4=;
	b=odklmosQEujXLtsQwuTC38TL0+TVka8vWhSdTt8w67Ze0p/6JsSx5iYMSAdz4eqw9+
	zDE2qDPZJp9YF4jIr+IVquKFa6KQE3TRNJnko2bTzliUmpbo+Sk7Fj1PhvoOH0EBrgro
	05+R7Y5P5fpe5ZTabeJ0Se7BaGjJLsSzT4CjBpP5gM+RwYVoWK7APe6W3mbQVEOdzvns
	++3Q0YR2yu3/oreX+h+qOwmYlJN5wkE2EVj+vZhBhjJSzTko49coDuVJHru4UF73UxuO
	OfIyUvvLrpo7yBB3KbDGxtPcuhXqB+zv0+1uyHVkXod6UjWRrH8sL5exjsgngVmi9G9y
	UVaA==
X-Gm-Message-State: APjAAAWT+Qiaojg7movqbBme65JrLZNMcK71u5IjbWYd4BjTcYv/4f/I
	dG9PQVNSiizQDPydJVIztQSVDron9I8=
X-Google-Smtp-Source: APXvYqyFJozLWPAdpJtfDyCblyv53hfGxHyeqBGStMBIAgCvXZ3U/gBtZjFT/sIdwRyH9IqOrxYKhw==
X-Received: by 2002:a63:1:: with SMTP id 1mr20158149pga.162.1564032450821;
	Wed, 24 Jul 2019 22:27:30 -0700 (PDT)
Received: from localhost.localdomain ([118.148.231.224])
	by smtp.gmail.com with ESMTPSA id
	137sm58978140pfz.112.2019.07.24.22.27.28
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 22:27:30 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 25 Jul 2019 17:27:03 +1200
Message-Id: <20190725052703.11313-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [oe-layersetup][PATCH] oe-layersetup.sh: Fix printf error if repo uri has space
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
X-List-Received-Date: Thu, 25 Jul 2019 05:28:27 -0000

If repo uri has space, then url will have '%20'
and script gives follwoing error
bash: printf: 'M': invalid format character

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 oe-layertool-setup.sh | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index 5a0175d..d14ed4f 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -276,12 +276,12 @@ configure_repo() {
 
     # Check if the repo with $name was already seen.  Use the , at the end
     # of the grep to avoid matching similar named repos.
-    temp=`printf "$output\n" | grep -e "^$name,"`
+    temp=`printf '%s\n' $output | grep -e "^$name,"`
 
     if [ "x$temp" != "x" ]
     then
         echo "This repository ($name) has already been configured with the following values:"
-        printf "\t$temp\n"
+        printf '\t%s\n' $temp
         echo "Skipping configuring duplicate repository"
         return 1
     fi
@@ -928,7 +928,7 @@ then
     then
         mkdir -p $dir
     fi
-    printf "$output\n" > $outputfile
+    printf '%s\n' $output > $outputfile
     echo "Output file is $outputfile"
 fi
 
-- 
2.17.1


