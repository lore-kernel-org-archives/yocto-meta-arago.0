Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9D4B8529A9
	for <meta-arago@arago-project.org>;
	Mon, 14 Oct 2019 12:30:08 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9ECSrPm125697
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2019 07:28:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571056133;
	bh=8vn/XlNw8aYesltkM9VcckB6pzz1cZIivlA6ZfRUDFI=;
	h=To:From:Subject:Date;
	b=fwaeaUXUtDGqIAnjfuI5foorWcEnBM5jXVSFu02cvgc9dWtQLvEp/r6lyfYfmpoWA
	6XkDlxzrOt9HgQJ5znDx2JTj21WTDbXisCGZNa8iUS33HygZzdtuYaEEYWfQOYUxCv
	b/d+sqeukQXcasaLNT0V4tdzL53UTCKMo4cN5Vzw=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ECSrig118188
	for <meta-arago@arago-project.org>; Mon, 14 Oct 2019 07:28:53 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 14 Oct 2019 07:28:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 14 Oct 2019 07:28:47 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9ECSphO018991;
	Mon, 14 Oct 2019 07:28:52 -0500
To: <meta-arago@arago-project.org>, Jacob Stiffler <j-stiffler@ti.com>, Denys
	Dmytriyenko <denys@ti.com>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <1d7507c5-ffa0-eeec-3575-5e42f1d14473@ti.com>
Date: Mon, 14 Oct 2019 17:58:50 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: KERNEL_DEVICETREE_append in custom layer does not take effect in ti-tisdk-makefile
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
X-List-Received-Date: Mon, 14 Oct 2019 12:30:09 -0000
Content-Type: multipart/alternative;
	boundary="------------0F616C218B110F1D1EA6AABD"
Content-Language: en-US

--------------0F616C218B110F1D1EA6AABD
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

Hi Denys/Jacob,

I am appending the KERNEL_DEVICETREE variable in the  meta-psdkla layer linux-ti-staging_%.bbappend recipe
All the additional DTB files get built correctly but the ti-tisdk-makefile recipe cannot replace the Makefile with the updated variable.

Instead, it replaces the Makefile with old value of KERNEL_DEVICETREE

How is this happening? Can you please help me with how to achieve the same?


Thanks & Regards,
Nikhil D

--------------0F616C218B110F1D1EA6AABD
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font face="Verdana">Hi Denys/Jacob,<br>
      <br>
      I am appending the KERNEL_DEVICETREE variable in the  meta-psdkla
      layer linux-ti-staging_%.bbappend recipe<br>
      All the additional DTB files get built correctly but the
      ti-tisdk-makefile recipe cannot replace the Makefile with the
      updated variable.<br>
      <br>
      Instead, it replaces the Makefile with old value of
      KERNEL_DEVICETREE<br>
      <br>
      How is this happening? Can you please help me with how to achieve
      the same?<br>
      <br>
      <br>
      Thanks &amp; Regards,<br>
      Nikhil D<br>
    </font>
  </body>
</html>

--------------0F616C218B110F1D1EA6AABD--
