Return-Path: <t-lannynd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB6A6EB3644
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 23:50:12 +0000 (UTC)
Received: from BYAPR05CU005.outbound.protection.outlook.com (BYAPR05CU005.outbound.protection.outlook.com [52.101.85.6])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6554.1772495406219561318
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 15:50:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=PlNJzG4i;
 spf=permerror, err=parse error for token &{10 18 spf.protection.outlook.com}: limit exceeded (domain: ti.com, ip: 52.101.85.6, mailfrom: t-lannynd@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IdTUVwYv0f5xX32hSrHJSJ/wGaz0J5Gxg8PM/W/xOQhEgtNg44wNduMKWdr+42o6J7ccfZPdtKIN20QHwg7Z7faG4Hrc4oF/WKOJfUJ7jnp0gN6JRqFPxhkmyQkMa3IDimYt52pmm2Pm4yM6h561j4zP84PrKT04XplAZ7LQbBvX+Z0uvAjtIrmRdchHhg/GcdhqANKTWCQbc+yYGB2vfFECyGSbYE1xM8syViyESJlbuw6b4dEoqnZwsFxuH5U1DLoM2NrfG0Xmf29w8rptly0o/HN6VBQHvPKwxfVtb5TfuX9RPJFOhOpiXDg/oVrprWQtaczFNu6yF8QIa9wwVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=reWLwkUFmgwYRS4SgCvkZYPgVnosDoe56dbzc0414tw=;
 b=FvaSsGbDx25hA71nnBqrpAGZQfDNXHGSaOOsLaGd5d3ElCPqrXTSJUVuxW39rceG9NVGCDKNU2JbXwpRRMpmdtEk/x3OZV0SweG3sMgWatqTQO3Ara3GGyVFm6/dBSTbZEJ0lBIyaqL+JXwLNltNmPVaWqDqZAU9AzoHmLaVpVKp/xwdEWWIRx9g2vFKoXbR6scOYq4k0m0NV/M1PkT6zYd83bL/o69n3XAcly79I8KG4MBIJ+GT23kmWFItQ0G2uJW3KpUQLBXy/+eaieC1V4gQdOYTrwL8+viUHmNXYdGz0tDNgbl+5PDxw2db0oa0YeIpYdagnrzZtVms6+vBYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=reWLwkUFmgwYRS4SgCvkZYPgVnosDoe56dbzc0414tw=;
 b=PlNJzG4igSsDYIjRAMLZV5wbcjQTYK5QUz0+kZGQeQwJatod5M86PV8xvQA1dELSxQ2odjuQlEBoONrC3Fo6tJR5iE8H6Nio1szQaG8sW8aW6ZhrjrIU6ZB+a0rscp0on3s49clOnrcguZytiXuULN1mwh9TFOGs8TXcXSx2X04=
Received: from MW4PR03CA0343.namprd03.prod.outlook.com (2603:10b6:303:dc::18)
 by MN0PR10MB6005.namprd10.prod.outlook.com (2603:10b6:208:3cb::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.18; Mon, 2 Mar
 2026 23:50:04 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:303:dc:cafe::94) by MW4PR03CA0343.outlook.office365.com
 (2603:10b6:303:dc::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9654.18 via Frontend Transport; Mon,
 2 Mar 2026 23:49:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.16 via Frontend Transport; Mon, 2 Mar 2026 23:50:03 +0000
Received: from DLEE208.ent.ti.com (157.170.170.97) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 17:50:00 -0600
Received: from DLEE213.ent.ti.com (157.170.170.116) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 2 Mar
 2026 17:49:59 -0600
Received: from DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c]) by
 DLEE213.ent.ti.com ([fe80::2d97:aeb6:bc08:d62c%20]) with mapi id
 15.02.2562.020; Mon, 2 Mar 2026 17:49:59 -0600
From: "Lannynd, Thorsten" <t-lannynd@ti.com>
To: "Davis, Andrew" <afd@ti.com>, "meta-arago@lists.yoctoproject.org"
	<meta-arago@lists.yoctoproject.org>
CC: "Etheridge, Darren" <detheridge@ti.com>, "Brnich, Brandon"
	<b-brnich@ti.com>, "Christidis, Antonios" <a-christidis@ti.com>
Subject: RE: [meta-arago][master][PATCH 3/4] meta-arago-test: Add curl-cffi
 and yt-dlp to ti-test-extras
Thread-Topic: [meta-arago][master][PATCH 3/4] meta-arago-test: Add curl-cffi
 and yt-dlp to ti-test-extras
Thread-Index: AQHcqpexsN33pGxtJES4Hq7qkpCURLWb5PdQ
Date: Mon, 2 Mar 2026 23:49:59 +0000
Message-ID: <dc5504deaef94d898642129969ad77c7@ti.com>
References: <20260302205436.1117890-1-t-lannynd@ti.com>
 <20260302205436.1117890-3-t-lannynd@ti.com>
 <c7bb76ec-980b-4086-a399-c7e76774e713@ti.com>
In-Reply-To: <c7bb76ec-980b-4086-a399-c7e76774e713@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.249.46.137]
x-c2processedorg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|MN0PR10MB6005:EE_
X-MS-Office365-Filtering-Correlation-Id: 8da2ac74-988e-4ea9-c164-08de78b66c81
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|42112799006|36860700013|34020700016|376014;
X-Microsoft-Antispam-Message-Info: 
	wA12chCZhvp6e7+JOyzknXCXzJdWwy58AFZgQFH9Rv9qYCV0mj8Zvno8k5RqYS+6WKgnfvQniyuY2UQJ0IMjpy1MH0EJbzpwp6/Ntm2Y2Hz7CHdhe92gqKxGTuK9ITxO2rNBflxMPqf/HHaVGnuUkkN3jmWPK+qsUeYZfhruMoUGdmuS7a8eMxHRyTHJdQRQTcr0teRspkPoZqVKPHAyYPaHMRm7v175WPRRdokuQT6ESP6riLnoe6Ej95fPZT9Ehul1qdeEu3eIgHB8PoY9FoeBE0+n71GzfxnJMVXsplA2fmv5SbmCrKpXlrpJYyN+E9triv14dC9Xf5H/iG8ndn5PXRTiZhKlsmEHBpvZQbnd1qm95YpNRDT6AScj9G2XP62ywRmGOfEHlIjxjKsnWSwp92mIl2niTd0fGW0MXzsBv98+dRzzYGPUsH25hkhUCG3sjtekl3MJ6PBNrsWurfTrEq8LOqvaPJh8rrzZFt+tDI7DbMXwbzIxFas9VhBvesACS94HpaGyx8NIrqK2VS3iSKkqnYl6YMD3SlRgqOK1TBSusALLME5v0RKEWaG6BR3rKJ5c22k/agx38ilwWxkKSl4eIN1vGiwfCgeObfaGo5Ww6DnZvnF80dIiUHxBl4zglnCVVV/sOVIvNvrBwUXFQBTm2x1ZbwE/YGFBMfeQOrrN/+o8FbA2ZqFtJFluQBmT3FgojpOdYmHBs3yhEMzgYbgqfBdvGzRF8HbFkpXBJqrWEUuxwm3WqXXRZ2KK19EimUffHNkbY7Gk4a5rmg==
X-Forefront-Antispam-Report: 
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(42112799006)(36860700013)(34020700016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	/YU/am9SkF9DQsFbtTbJDgJYcUyRv9Ggq7tQkgmAAQ/xTNH1XaQonoJpN/8P0FiKiq+xV3+mDDv4eHMIeKJlE8Smml09iXn94Uu0vlOCokTHez0EEOM5RWcNRmNXHrEFylSNF797dK3hNWYgRUDu6xJ4yKetmCO/cWwtlduolJwVZCu+FUeD+F75cls8bgDEUdFU8uK/ydVov3ABsSjnVrqtE2Zaun43J7rOUMNUNfCXOZ3Kku+T1kvJMhzGPWtfOJs/D7foI1gTDD/M4uEUGDpCnpnye1PuMNclQHx2Oe3KpHzcdNDo7YIl7xIYlPc/VMABDnA1FXFHOxIRbxxgMHHvvvWoxMCDZUww4LPpSgC0BDf+9wTWhHN5k6V24Nh7yfTcm2ALWsFhig9fK+prb57+c5UB16cqaI4k3MdpXK3FO1VcpX65EyrPl2OM5UhO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2026 23:50:03.1648
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8da2ac74-988e-4ea9-c164-08de78b66c81
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR10MB6005
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 02 Mar 2026 23:50:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17183

T24gMy8yLzI2IDQ6NTYgUE0sIEFuZHJldyBEYXZpcyB3cm90ZToNCj4gT24gMy8yLzI2IDI6NTQg
UE0sIFRob3JzdGVuIExhbm55bmQgdmlhIGxpc3RzLnlvY3RvcHJvamVjdC5vcmcgd3JvdGU6DQo+
ID4gQWRkIGN1cmwtY2ZmaSBhbmQgeXQtZGxwIHRvIHRoZSBUSV9URVNUX0VYVFJBUyBwYWNrYWdl
Z3JvdXAgZm9yDQo+ID4gYWRkaXRpb25hbCB0ZXN0aW5nIGNhcGFiaWxpdGllcy4NCj4gPg0KPiA+
IC0gY3VybC1jZmZpOiBQeXRob24gbGlicmFyeSBmb3IgY3VybC1pbXBlcnNvbmF0ZSBmdW5jdGlv
bmFsaXR5DQo+ID4gLSB5dC1kbHA6IEVuaGFuY2VkIHlvdXR1YmUtZGwgZm9yayB3aXRoIGFkZGl0
aW9uYWwgZmVhdHVyZXMNCj4gPg0KPiANCj4gRGlkbid0IHlvdXR1YmUtZGwgcnVuIGludG8gc29t
ZSBsZWdhbCBpc3N1ZXMuLiBDb3VsZCB5b3UgZXhwYW5kIG9uIHdoYXQNCj4gdGhlc2UgImFkZGl0
aW9uYWx0ZXN0aW5nIGNhcGFiaWxpdGllcyIgd2lsbCBiZT8NCj4gDQpUaGVzZSBwYWNrYWdlcyBl
bmFibGUgYXV0b21hdGVkIENocm9taXVtIHRlc3RpbmcgdG8gdmVyaWZ5IHZpZGVvIHN0cmVhbXMg
ZGlzcGxheSBjb3JyZWN0bHkuIE91ciB1c2FnZSBpcyBtaW5pbWFsOg0KDQp5dC1kbHAgLWcgaHR0
cHM6Ly9wbGF5ZXIudmltZW8uY29tL3ZpZGVvLzI1MzkwNTE2Mw0KDQpUaGlzIGV4dHJhY3RzIG9u
bHkgdGhlIGRpcmVjdCBDRE4gVVJMIHRvIEJpZyBCdWNrIEJ1bm55IChDQy1saWNlbnNlZCkgaG9z
dGVkIG9uIFZpbWVv4oCUbm8gZG93bmxvYWRpbmcgb2NjdXJzIHZpYSB5dC1kbHAgaXRzZWxmLiBX
ZSB0aGVuIHVzZSB0aGlzIFVSTCB0bzoNCg0KICAtIEV4dHJhY3Qgc3BlY2lmaWMgZnJhbWVzIGF0
IGtub3duIHRpbWVzdGFtcHMgYXMgZ29sZGVuIHJlZmVyZW5jZXMNCiAgLSBWYWxpZGF0ZSBoYXJk
d2FyZSB2aWRlbyBkZWNvZGluZyBhbmQgQ2hyb21pdW0gcmVuZGVyaW5nIHBpcGVsaW5lDQogIC0g
Y3VybC1jZmZpIHByb3ZpZGVzIHRoZSBtb2Rlcm4gVExTL0hUVFAgY2FwYWJpbGl0aWVzIHJlcXVp
cmVkIGJ5IHZpZGVvIGhvc3RpbmcgcGxhdGZvcm1zDQoNClRoaXMgYXBwcm9hY2ggZWxpbWluYXRl
cyB0aGUgbmVlZCB0byBkb3dubG9hZCwgc3RvcmUsIGFuZC9vciBob3N0IGdvbGRlbiByZWZlcmVu
Y2UgdmlkZW9zIGFuZCBhbGxvd3MgdGVzdGluZyB3aXRoIFZpbWVvIGRpcmVjdGx5LiBXZSBjYW4g
cHJvZ3JhbW1hdGljYWxseSBleHRyYWN0IHRoZSBleGFjdCBmcmFtZXMgbmVlZGVkIGZvciB2YWxp
ZGF0aW9uIGRpcmVjdGx5IGZyb20gdGhlIHNvdXJjZSwgZW5zdXJpbmcgb3VyIGhhcmR3YXJlIHZp
ZGVvIGRlY29kaW5nIGFuZCBDaHJvbWl1bSByZW5kZXJpbmcgcGlwZWxpbmUgd29yayBjb3JyZWN0
bHkuDQoNClRob3JzdGVuDQo+IEFuZHJldw0KPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9yc3Rl
biBMYW5ueW5kIDx0LWxhbm55bmRAdGkuY29tPg0KPiA+IC0tLQ0KPiA+ICAgbWV0YS1hcmFnby10
ZXN0L3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3RpLXRlc3QuYmIgfCAyICsrDQo+ID4gICAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvbWV0
YS1hcmFnby10ZXN0L3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3RpLXRlc3QuYmINCj4gPiBi
L21ldGEtYXJhZ28tdGVzdC9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy90aS10ZXN0LmJiDQo+
ID4gaW5kZXggZjJhZTFhZWYuLmQxZDA0OWMyIDEwMDY0NA0KPiA+IC0tLSBhL21ldGEtYXJhZ28t
dGVzdC9yZWNpcGVzLWNvcmUvcGFja2FnZWdyb3Vwcy90aS10ZXN0LmJiDQo+ID4gKysrIGIvbWV0
YS1hcmFnby10ZXN0L3JlY2lwZXMtY29yZS9wYWNrYWdlZ3JvdXBzL3RpLXRlc3QuYmINCj4gPiBA
QCAtNzcsMTAgKzc3LDEyIEBAIFRJX1RFU1RfRVhUUkFTX09QRU5DTCA9ICIgXA0KPiA+ICAgIg0K
PiA+DQo+ID4gICBUSV9URVNUX0VYVFJBUyA9ICIgXA0KPiA+ICsgICAgY3VybC1jZmZpIFwNCj4g
PiAgICAgICBweXRob24zLXBpbGxvdyBcDQo+ID4gICAgICAgcHl0ZXNzZXJhY3QgXA0KPiA+ICAg
ICAgIHB5dGhvbjMtbnVtcHkgXA0KPiA+ICAgICAgIHdheWxhbmQtdXRpbHMgXA0KPiA+ICsgICAg
eXQtZGxwIFwNCj4gPiAgICAgICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVT
JywgJ29wZW5nbCcsDQo+ICcke1RJX1RFU1RfRVhUUkFTX09QRU5HTH0nLCAnJywgZCl9IFwNCj4g
PiAgICAgICAke0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ29wZW5jbCcs
DQo+ICcke1RJX1RFU1RfRVhUUkFTX09QRU5DTH0nLCAnJywgZCl9IFwNCj4gPiAgICINCg0K

