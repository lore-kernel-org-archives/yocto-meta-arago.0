Return-Path: <mrinmayee@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8013A52A1B
	for <meta-arago@arago-project.org>;
	Fri, 19 Jul 2013 06:03:54 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r6J63qpM025611
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 01:03:53 -0500
Received: from DBDE73.ent.ti.com (dbde73.ent.ti.com [172.24.171.98])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id r6J63o3x031764
	for <meta-arago@arago-project.org>; Fri, 19 Jul 2013 01:03:51 -0500
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE73.ent.ti.com ([fe80::bc19:dc43:44da:7415%27]) with mapi id
	14.02.0342.003; Fri, 19 Jul 2013 14:03:50 +0800
From: "Hingolikar, Mrinmayee" <mrinmayee@ti.com>
To: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Thread-Topic: [PATCH-oe-layersetup 0/2] Enable oe-layertool-setup.sh to use
	GLSDK branding
Thread-Index: AQHOe8e9i6fBAmrQWkafwELTRZLfxplrk9KQ
Date: Fri, 19 Jul 2013 06:03:50 +0000
Message-ID: <CF956B779D819D41BBC043B7082161D5440731@DBDE04.ent.ti.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.24.170.142]
MIME-Version: 1.0
Subject: [PATCH-oe-layersetup 0/2] Enable oe-layertool-setup.sh to use GLSDK branding
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
X-List-Received-Date: Fri, 19 Jul 2013 06:03:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


* In order to use GLSDK branding, a variable ARAGO_BRAND needs to be
  set in local.conf.
* This patch set adds a conf.sample file for GLSDK that contains the
  ARAGO_BRAND set to GLSDK branding, and edits the OECORELOCALCONF
  variable in GLSDK config to pick up the GLSDK conf.sample.
* THE oe-layertool-setup.sh would generate local.conf from the GLSDK conf.s=
ample.

Mrinmayee Hingolikar (2):
  sample-files: Added conf.sample file for GLSDK.
  configs : Override OECORELOCALCONF to use the glsdk.conf.sample.

 configs/glsdk/glsdk-06.01.00-config.txt            |    2 +-
 ...-linaro.conf.sample =3D> local-glsdk.conf.sample} |    4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)  copy sample-files/{local=
-arago-linaro.conf.sample =3D> local-glsdk.conf.sample} (99%)


