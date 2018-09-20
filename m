Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id A960C52094
	for <meta-arago@arago-project.org>;
	Thu, 20 Sep 2018 20:34:51 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8KKYh2x101535
	for <meta-arago@arago-project.org>; Thu, 20 Sep 2018 15:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537475683;
	bh=TTWO4d9JTFe2HOYu2HWQ9R7rYBxGiw1Cktglwr0lTgY=;
	h=From:To:CC:Subject:Date;
	b=SeNlk3gCZ/AM4xUGqup2rPGL+2uG7d6Brgz1+Itmgzb6PrvGKhYbrBFOjMxEINJzG
	m1EdmuKHWKKJ1s6j/Wi6oy7AaNiS10ZhVFPcaLjZ8zoEbj7MrXsZ057sVJn5I9r5rN
	XhU6p7D1/ZiO3NrFPyFvqp3qXO6oWHsf8KyxCd38=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8KKYhwK011449
	for <meta-arago@arago-project.org>; Thu, 20 Sep 2018 15:34:43 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 20 Sep 2018 15:34:42 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 20 Sep 2018 15:34:43 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8KKYgZG005695;
	Thu, 20 Sep 2018 15:34:42 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 20 Sep 2018 16:34:40 -0400
Message-ID: <1537475680-6278-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [matrix-gui-v2-apps] [PATCH] dsp66_multimedia_imgproc_f2f: replace qtmux with mpegtsmux in the gstreamer pipeline
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
X-List-Received-Date: Thu, 20 Sep 2018 20:34:52 -0000
Content-Type: text/plain

* qtmux could not multiplex stream with error "Buffer has no PTS"

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../dsp66_multimedia_imgproc_f2f/runDsp66ImgProcSave2File.sh            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/multimedia_apps/dsp66_multimedia_imgproc_f2f/runDsp66ImgProcSave2File.sh b/multimedia_apps/dsp66_multimedia_imgproc_f2f/runDsp66ImgProcSave2File.sh
index 4c794ef..1bd1990 100644
--- a/multimedia_apps/dsp66_multimedia_imgproc_f2f/runDsp66ImgProcSave2File.sh
+++ b/multimedia_apps/dsp66_multimedia_imgproc_f2f/runDsp66ImgProcSave2File.sh
@@ -13,4 +13,4 @@ echo ""
 echo "Launch GStreamer pipeline"
 echo ""
 
-gst-launch-1.0 filesrc location=$input_filename ! 'video/x-raw, format=(string)NV12, framerate=(fraction)24/1, width=(int)1280, height=(int)720'  ! queue ! h265dec threads=1 ! videoconvert ! queue ! dsp66videokernel kerneltype=1 filtersize=9 lum-only=1 ! queue ! videoscale ! 'video/x-raw, width=(int)640, height=(int)480' ! avenc_mpeg4 ! mpeg4videoparse ! qtmux ! queue ! filesink location=$output_filename
+gst-launch-1.0 filesrc location=$input_filename ! 'video/x-raw, format=(string)NV12, framerate=(fraction)24/1, width=(int)1280, height=(int)720'  ! queue ! h265dec threads=1 ! videoconvert ! queue ! dsp66videokernel kerneltype=1 filtersize=9 lum-only=1 ! queue ! videoscale ! 'video/x-raw, width=(int)640, height=(int)480' ! avenc_mpeg4 ! mpeg4videoparse ! mpegtsmux ! queue ! filesink location=$output_filename
-- 
1.9.1


