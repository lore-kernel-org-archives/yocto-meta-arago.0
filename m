Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id C20A35203A
	for <meta-arago@arago-project.org>;
	Mon, 16 Apr 2018 22:12:44 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3GMCfgQ008678
	for <meta-arago@arago-project.org>; Mon, 16 Apr 2018 17:12:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1523916761;
	bh=OBdEKm982TB4mTYE0/fgt5Pc1L94zpszUVeYJVuHV48=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JgS2EU7GS2TPNH8Uwr88pyxTIuuce25MBaGHp132BAUF9Kjj5hkCglt80wRR/pcq2
	+rgSaktnsyDweJNBvnGW4Wb8aDtUe7lMboWdRTuYEjvLkz4ShgshUHNUgnozfLm+9C
	D7dDp5KoBjnVSymexJ9MxroEpVIAduppKgAk0Imc=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GMCfFs029913
	for <meta-arago@arago-project.org>; Mon, 16 Apr 2018 17:12:41 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 16 Apr 2018 17:12:41 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 16 Apr 2018 17:12:41 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3GMCfkc006425;
	Mon, 16 Apr 2018 17:12:41 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 16 Apr 2018 18:12:34 -0400
Message-ID: <1523916755-32359-2-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1523916755-32359-1-git-send-email-a0271529@ti.com>
References: <1523916755-32359-1-git-send-email-a0271529@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [arm_benchmarks] [PATCH 1/2] linpack: fix compilation warnings
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
X-List-Received-Date: Mon, 16 Apr 2018 22:12:45 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 linpack/linpack.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/linpack/linpack.c b/linpack/linpack.c
index d663ff1..58365df 100644
--- a/linpack/linpack.c
+++ b/linpack/linpack.c
@@ -91,6 +91,14 @@ You must specify one of -DROLL or -DUNROLL to compile correctly.
 
 static REAL time[9][9];
 
+void print_time();
+void matgen();
+void dgefa();
+void dgesl();
+void daxpy();
+void dscal();
+void dmxpy ();
+
 int main (void)
 {
 	static REAL aa[200][200],a[200][201],b[200],x[200];
@@ -296,7 +304,7 @@ int main (void)
 }
      
 /*----------------------*/ 
-print_time (row)
+void print_time (row)
 int row;
 {
 fprintf(stderr,"%11.2f%11.2f%11.2f%11.0f%11.2f%11.2f\n",   (double)time[0][row],
@@ -305,7 +313,7 @@ fprintf(stderr,"%11.2f%11.2f%11.2f%11.0f%11.2f%11.2f\n",   (double)time[0][row],
 }
       
 /*----------------------*/ 
-matgen(a,lda,n,b,norma)
+void matgen(a,lda,n,b,norma)
 REAL a[],b[],*norma;
 int lda, n;
 
@@ -335,7 +343,7 @@ function, references to a[i][j] are written a[lda*j+i].  */
 }
 
 /*----------------------*/ 
-dgefa(a,lda,n,ipvt,info)
+void dgefa(a,lda,n,ipvt,info)
 REAL a[];
 int lda,n,ipvt[],*info;
 
@@ -447,7 +455,7 @@ int idamax(),j,k,kp1,l,nm1;
 
 /*----------------------*/ 
 
-dgesl(a,lda,n,ipvt,b,job)
+void dgesl(a,lda,n,ipvt,b,job)
 int lda,n,ipvt[],job;
 REAL a[],b[];
 
@@ -571,7 +579,7 @@ function, references to a[i][j] are written a[lda*i+j].  */
 
 /*----------------------*/ 
 
-daxpy(n,da,dx,incx,dy,incy)
+void daxpy(n,da,dx,incx,dy,incy)
 /*
      constant times a vector plus a vector.
      jack dongarra, linpack, 3/11/78.
@@ -685,7 +693,7 @@ int incx,incy,n;
 }
 
 /*----------------------*/ 
-dscal(n,da,dx,incx)
+void dscal(n,da,dx,incx)
 
 /*     scales a vector by a constant.
       jack dongarra, linpack, 3/11/78.
@@ -826,7 +834,7 @@ REAL x;
 }
  
 /*----------------------*/ 
-dmxpy (n1, y, n2, ldm, x, m)
+void dmxpy (n1, y, n2, ldm, x, m)
 REAL y[], x[], m[];
 int n1, n2, ldm;
 
-- 
1.9.1


