Return-Path: <bgvmysore@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 105FFC433FE
	for <webhook@archiver.kernel.org>; Fri,  7 Oct 2022 16:54:26 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com
 [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.6969.1665161660236059096
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 09:54:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=nzggR1IM;
 spf=pass (domain: gmail.com, ip: 209.85.215.171,
 mailfrom: bgvmysore@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id e129so5136406pgc.9
        for <meta-arago@lists.yoctoproject.org>;
 Fri, 07 Oct 2022 09:54:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ff/x6zJvDM/00xKI+qTGoRcv6M4ve2xFDtkQ8ZpSPO8=;
        b=nzggR1IM7ttPBYcTZODoNeCujbx2wYY+h+JDslyefOppx2QK/lRNWq7wF7z5xrCth9
         latoUIcnazz0adPq1GnKD+zFLBRwl7IF0ITXLpdKBX6ev6NvPUJBL0kivlOyD8/594mE
         5Rxt1iuQuBYCCk0Hnm55xZOGZ3X8ZGcMulkihzQFdKetJ3aVt/AIpNjmONQEv2+16HBh
         rtHAaB+UA5bWx1mHUFXqTigjw5R+tpXwWDnO5PaFYuLAnmOLAYXeH9V1b0CB0RNZK4x+
         hux8/n+794Rdp+hQ9h+ckYeFPfFwdA2CpMIaaDoQIwBdao3SFDxGNfnKkk+7z54FYWRH
         B8Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ff/x6zJvDM/00xKI+qTGoRcv6M4ve2xFDtkQ8ZpSPO8=;
        b=iTraKBXEjIYC3QNeoaPyY51+c3xcMugARI4wxXRm1FJU8alzLW1xJhVk+l//gzdNc9
         QOy3lrMrz4yTSYErZdDPuXSqHSSbg4h54FwSeuIHqePr6EkVdc2HcrriK5/UfPPiNOkB
         0tMz4MxJhftDH2BS1qhdSw2Ek7oSLsrNSnnXK60ea6dsn+YOZ2xsjT9LS9oe3NWJWic6
         x3zxQVjdsSg3lGVahlkL0riTuxbq8fkqcoHQfbbwPmQLRJweNvYQSZIoc3iq62nssmuC
         55Wx2rZkTrcF5I3DG2M3A7nhkww+0e0fA1No57tVLq/lAkGRyBaUYNvzSuc94+y+59Nd
         fbdw==
X-Gm-Message-State: ACrzQf2pq50glZ/gCOEPzQy6xf6f5Ivuu0mbHqZaYgmDEa3pTKg3YIJ1
	s7nFFEGi5UucZT2HppojOQFxFAeQHNDpow==
X-Google-Smtp-Source: 
 AMsMyM5KAqHJH17gEaxfhON0BrjpuXKSJRN1OVPKPiH6954lclSQHtTBHf71rjacM5AymdZvziST+g==
X-Received: by 2002:a05:6a00:4085:b0:562:527f:d80e with SMTP id
 bw5-20020a056a00408500b00562527fd80emr6201038pfb.86.1665161659097;
        Fri, 07 Oct 2022 09:54:19 -0700 (PDT)
Received: from bgvpc.www.tendawifi.com ([103.2.235.212])
        by smtp.gmail.com with ESMTPSA id
 f69-20020a623848000000b0053ae018a91esm1894731pfa.173.2022.10.07.09.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Oct 2022 09:54:17 -0700 (PDT)
From: Bhargav R <bgvmysore@gmail.com>
To: meta-arago@lists.yoctoproject.org
Cc: reatmon@ti.com,
	denys@konsulko.com,
	Bhargav R <bgvmysore@gmail.com>
Subject: [meta-arago] [dunfell][PATCH]: Fix hardcoded filename containing
 .rootfs to use IMAGE_NAME_SUFFIX
Date: Fri,  7 Oct 2022 22:23:58 +0530
Message-Id: <20221007165358.16733-1-bgvmysore@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 07 Oct 2022 16:54:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14059

In meta-arago-distro/classes/image_types_md5.bbclass, the filename for md5sum is is hardcoded with .rootfs as suffix.
The build fails in do_image_tar if IMAGE_NAME_SUFFIX is set to a different value.
Changing '.rootfs' to ${IMAGE_NAME_SUFFIX} to fix this issue.

Signed-off-by: Bhargav Raviprakash <bgvmysore@gmail.com>
---
 meta-arago-distro/classes/image_types_md5.bbclass | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/classes/image_types_md5.bbclass b/meta-arago-distro/classes/image_types_md5.bbclass
index 9e2c04fa..4712e1a1 100644
--- a/meta-arago-distro/classes/image_types_md5.bbclass
+++ b/meta-arago-distro/classes/image_types_md5.bbclass
@@ -1,9 +1,9 @@
 inherit image_types
 
 COMPRESSIONTYPES += "gz.md5"
-COMPRESS_CMD_gz.md5 = "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}.rootfs.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
+COMPRESS_CMD_gz.md5 = "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.gz.md5"
 IMAGE_TYPES += "tar.gz.md5"
 
 COMPRESSIONTYPES += "xz.md5"
-COMPRESS_CMD_xz.md5 = "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}.rootfs.${type}.xz > ${IMAGE_NAME}.rootfs.${type}.xz.md5"
+COMPRESS_CMD_xz.md5 = "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz > ${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.${type}.xz.md5"
 IMAGE_TYPES += "tar.xz.md5"
-- 
2.34.1


