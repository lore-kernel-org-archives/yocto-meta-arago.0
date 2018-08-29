Return-Path: <qsu@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 75540529AE
	for <meta-arago@arago-project.org>;
	Wed, 29 Aug 2018 14:12:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7TECBdJ028552
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 09:12:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535551931;
	bh=0rjUd/7AzvHILqpVTcvtm0Jg1SCykcI5cAsgD1BM6lk=;
	h=From:To:Subject:Date:References:In-Reply-To;
	b=zDOxvmxpycQKzfAb/g4RhxZ1gL5/HnjQfqDRrXTG34ShWXKNjxY9GAd8FZElPnx0L
	vVxnNqKRyL2A3HvkLS1hFISsjA3s3wUuDOPbdM95B3sqBcdoTum7gDmiz8ZauQuB79
	Stj0c8ZTdX+qebA6F0uYupJquWcmlYz9qx+J2w0U=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7TECBVI030175
	for <meta-arago@arago-project.org>; Wed, 29 Aug 2018 09:12:11 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 29 Aug 2018 09:12:11 -0500
Received: from DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe]) by
	DFLE107.ent.ti.com ([fe80::86f:14f0:164b:4dbe%17]) with mapi id
	15.01.1466.003; Wed, 29 Aug 2018 09:12:10 -0500
From: "Su, Qin" <qsu@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>
Thread-Topic: [EXTERNAL] Your message to meta-arago awaits moderator approval
Thread-Index: AQHUPteGWeUKFZm1XkiN3fkDoAzvqaTWw4cA
Date: Wed, 29 Aug 2018 14:12:10 +0000
Message-ID: <c471aac63c7c451eb601963f8407bb94@ti.com>
References: <mailman.3529.1535464849.29657.meta-arago@arago-project.org>
In-Reply-To: <mailman.3529.1535464849.29657.meta-arago@arago-project.org>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [158.218.113.70]
x-exclaimer-md-config: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
MIME-Version: 1.0
Subject: FW: [EXTERNAL] Your message to meta-arago awaits moderator approval
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
X-List-Received-Date: Wed, 29 Aug 2018 14:12:19 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Denys,

Armnn-caffe has two local files:
caffe.pb.cc - 2,776 KB
caffe.pb.h - 1,620 KB

These files are from TIDL release. We do not have complete Caffe available =
to generate these files.

The zipped size of the files is 406 KB (still > 100 KB). Is it acceptable?

Thanks,
Qin

-----Original Message-----
From: meta-arago-bounces@arago-project.org [mailto:meta-arago-bounces@arago=
-project.org]=20
Sent: Tuesday, August 28, 2018 10:01 AM
To: Su, Qin
Subject: [EXTERNAL] Your message to meta-arago awaits moderator approval

Your mail to 'meta-arago' with the subject

    [PATCH v2 1/3] armnn-caffe: caffe protobuf files used in building caffe=
 models in armnn.

Is being held until the list moderator can review it for approval.

The reason it is being held:

    Message body is too big: 4494547 bytes with a limit of 100 KB

Either the message will get posted to the list, or you will receive notific=
ation of the moderator's decision.  If you would like to cancel this postin=
g, please visit the following URL:

    http://arago-project.org/cgi-bin/mailman/confirm/meta-arago/5f2a6342b93=
1a525255d02d94bc899ce9f536808


