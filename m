Return-Path: <hnagalla@gmail.com>
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
	[209.85.210.48])
	by arago-project.org (Postfix) with ESMTPS id D94DA529C8
	for <meta-arago@arago-project.org>;
	Wed, 17 Mar 2021 09:52:08 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
	v24-20020a9d69d80000b02901b9aec33371so1199644oto.2
	for <meta-arago@arago-project.org>;
	Wed, 17 Mar 2021 02:52:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=c1sc82t2Sfv+7ZWJ73DwR77Cexf3ER9aTTs68AbjO2Y=;
	b=SLEihiGTNVEWz0JRtd7Sb3XqNxiOLFHBPdLLz3IY40yTuhgF4UcPJ4Osl37d9nA4O1
	d26tZl4F4ftnOjF+78CSTAgX5S+EXnnxOAaeCh1TUTp2kkuaWIVxNDTEml8EAeH6Xnh4
	yysUeJIxj6XrGj5+ej3ZhQAWn2LrNzgYx5lcbTA6ePPNDvF5DSLRefvjK+qwsd862zTP
	era3uAwnt1y0U7qZajoZnDSfHTMFLLCS3INBUnfRDmSep9dTj7ZVD2HOdTHOg2N+dH9R
	6QQahXo+wZeW9OQa5wx+Ilu0NT7nuYFtazrSqRgdz1JNk8IUe1tAeq0nHwL20cKtQJ0o
	V2Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c1sc82t2Sfv+7ZWJ73DwR77Cexf3ER9aTTs68AbjO2Y=;
	b=p7JQrPuVXUTQnm/Dgc7mDPJyjbVR14w75BaleRXQnPryIwSNZljGBrRz3O+J1TAF7+
	odX/Q+VUaqiZoirLZpZMxuNOU3ydxzkCDeqF9+tXWmRb/77IbYx489cgSdY5lLbLn7vt
	/apbxk0xiBNajyhbXW0G5xbxJmxX8ogcGFHJ0tdFB1o11pVSAoEGxS6aCjwzVhW16WwW
	m8BlddElr9uY8J0NGg71bfhOPpcAtOmffdcA2zPzROf2ceoia0sai6P9Cu9W1/fDu7sh
	HRILERPVKAHKScptSqkQjvkc35mKbjwFnvqTVQDNFOfe42Re1DuNpEV9O0uv6DYx/Se9
	OtNQ==
X-Gm-Message-State: AOAM531230TOnaoqAfzKZbHiicuCXDua5u8EAPZhZTj3Sw2UpE2LjpM6
	Rgb5jHFfMdVXo8vIiEScg7CUxBh7UU6dAA==
X-Google-Smtp-Source: ABdhPJyTV6UNEEHpkOLkyA5kp7wV5NzK38lYrV3n0DLcDxUMs+53WHVAKNzXXQ6TVfz4IoPOULx4Rg==
X-Received: by 2002:a05:6830:1644:: with SMTP id
	h4mr2622255otr.349.1615974744774; 
	Wed, 17 Mar 2021 02:52:24 -0700 (PDT)
Received: from localhost.localdomain ([24.170.5.142])
	by smtp.gmail.com with ESMTPSA id x3sm7886061oif.22.2021.03.17.02.52.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 17 Mar 2021 02:52:24 -0700 (PDT)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 17 Mar 2021 04:52:00 -0500
Message-Id: <20210317095201.7528-1-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [ 0/1] *** BT_TI moved to CONNECTIVITY_RDEPENDS ***
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
X-List-Received-Date: Wed, 17 Mar 2021 09:52:09 -0000

*** BLURB HERE ***

Hari Nagalla (1):
  Move BT_TI (BT FW etc) to CONNECTIVITY_RDEPENDS, as it is needed
    across all platforms

 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb    | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

-- 
2.17.1


