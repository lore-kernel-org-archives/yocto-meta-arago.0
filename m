Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D595E52987
	for <meta-arago@arago-project.org>;
	Wed, 19 Aug 2015 13:58:53 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7JDwqIF014527
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:58:52 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDwqX4006820
	for <meta-arago@arago-project.org>; Wed, 19 Aug 2015 08:58:52 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 19 Aug 2015 08:58:52 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7JDwqih013903;
	Wed, 19 Aug 2015 08:58:52 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZS3tD-0004CS-JI; Wed, 19 Aug 2015 09:58:51 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Aug 2015 09:58:41 -0400
Message-ID: <1439992726-16109-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2 0/5] TI OpenCL
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
X-List-Received-Date: Wed, 19 Aug 2015 13:58:54 -0000
Content-Type: text/plain

This patch set provides the complte set of OpenCL packages for
TI devices.

v2 changes: Update descrption and homepage.

Jacob Stiffler (5):
  clocl: Add opencl kernel compiler.
  opencl-monitor: Add opencl monitor firmware
  ocl-gl-headers: Add GL headers required for opencl.
  opencl: Add the opencl library
  opencl-examples: Add the opencl examples.

 meta-arago-extras/recipes-ti/ocl/clocl_git.bb      |    34 +
 .../recipes-ti/ocl/ocl-gl-headers/GL/gl.h          |  2235 ++++
 .../recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h   |  2311 ++++
 .../recipes-ti/ocl/ocl-gl-headers/GL/glext.h       | 10776 +++++++++++++++++++
 .../recipes-ti/ocl/ocl-gl-headers/GL/glx.h         |   513 +
 .../recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h  |    82 +
 .../recipes-ti/ocl/ocl-gl-headers/GL/glxext.h      |  1001 ++
 .../ocl/ocl-gl-headers/GL/internal/dri_interface.h |  1189 ++
 .../recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h      |   283 +
 .../recipes-ti/ocl/ocl-gl-headers/GL/wglext.h      |   901 ++
 .../recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h       |   140 +
 .../recipes-ti/ocl/ocl-gl-headers_git.bb           |    25 +
 meta-arago-extras/recipes-ti/ocl/ocl.inc           |    10 +
 .../recipes-ti/ocl/opencl-examples_git.bb          |    77 +
 .../recipes-ti/ocl/opencl-monitor_git.bb           |    58 +
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb     |    55 +
 16 files changed, 19690 insertions(+)
 create mode 100644 meta-arago-extras/recipes-ti/ocl/clocl_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/gl_mangle.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glext.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glx_mangle.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/glxext.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/internal/dri_interface.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/osmesa.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wglext.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers/GL/wmesa.h
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl-gl-headers_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/ocl/ocl.inc
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-examples_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl-monitor_git.bb
 create mode 100644 meta-arago-extras/recipes-ti/ocl/opencl_git.bb

-- 
1.9.1


