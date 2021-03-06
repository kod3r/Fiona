# Copyright (c) 2007, Sean C. Gillies
# All rights reserved.
# See ../LICENSE.txt

cdef extern from "cpl_conv.h":
    void    CPLFree (void *ptr)
    void    CPLSetThreadLocalConfigOption (char *key, char *val)

cdef extern from "cpl_string.h":
    char ** CSLSetNameValue (char **list, char *name, char *value)
    void    CSLDestroy (char **list)

ctypedef int OGRErr
ctypedef struct OGREnvelope:
    double MinX
    double MaxX
    double MinY
    double MaxY

cdef extern from "ogr_core.h":
    char *  OGRGeometryTypeToName(int)

cdef extern from "ogr_srs_api.h":
    void    OSRCleanup ()
    void *  OSRClone (void *srs)
    void    OSRDestroySpatialReference (void *srs)
    OGRErr  OSRExportToProj4 (void *srs, char **params)
    OGRErr  OSRImportFromProj4 (void *srs, char *proj)
    void *  OSRNewSpatialReference (char *wkt)
    void    OSRRelease (void *srs)

cdef extern from "ogr_api.h":
    char *  OGR_Dr_GetName (void *driver)
    void *  OGR_Dr_CreateDataSource (void *driver, char *path, char **options)
    int     OGR_Dr_DeleteDataSource (void *driver, char *)
    int     OGR_DS_DeleteLayer (void *datasource, int n)
    void *  OGR_DS_CreateLayer (void *datasource, char *name, void *crs, int geomType, char **options)
    void *  OGR_DS_ExecuteSQL (void *datasource, char *name, void *filter, char *dialext)
    void    OGR_DS_Destroy (void *datasource)
    void *  OGR_DS_GetDriver (void *layer_defn)
    void *  OGR_DS_GetLayerByName (void *datasource, char *name)
    int     OGR_DS_GetLayerCount (void *datasource)
    void *  OGR_DS_GetLayer (void *datasource, int n)
    void    OGR_DS_ReleaseResultSet (void *datasource, void *results)
    int     OGR_DS_SyncToDisk (void *datasource)
    void *  OGR_F_Create (void *featuredefn)
    void    OGR_F_Destroy (void *feature)
    long    OGR_F_GetFID (void *feature)
    int     OGR_F_IsFieldSet (void *feature, int n)
    int     OGR_F_GetFieldAsDateTime (void *feature, int n, int *y, int *m, int *d, int *h, int *m, int *s, int *z)
    double  OGR_F_GetFieldAsDouble (void *feature, int n)
    int     OGR_F_GetFieldAsInteger (void *feature, int n)
    char *  OGR_F_GetFieldAsString (void *feature, int n)
    int     OGR_F_GetFieldCount (void *feature)
    void *  OGR_F_GetFieldDefnRef (void *feature, int n)
    int     OGR_F_GetFieldIndex (void *feature, char *name)
    void *  OGR_F_GetGeometryRef (void *feature)
    void    OGR_F_SetFieldDateTime (void *feature, int n, int y, int m, int d, int hh, int mm, int ss, int tz)
    void    OGR_F_SetFieldDouble (void *feature, int n, double value)
    void    OGR_F_SetFieldInteger (void *feature, int n, int value)
    void    OGR_F_SetFieldString (void *feature, int n, char *value)
    int     OGR_F_SetGeometryDirectly (void *feature, void *geometry)
    void *  OGR_FD_Create (char *name)
    int     OGR_FD_GetFieldCount (void *featuredefn)
    void *  OGR_FD_GetFieldDefn (void *featuredefn, int n)
    int     OGR_FD_GetGeomType (void *featuredefn)
    char *  OGR_FD_GetName (void *featuredefn)
    void *  OGR_Fld_Create (char *name, int fieldtype)
    void    OGR_Fld_Destroy (void *fielddefn)
    char *  OGR_Fld_GetNameRef (void *fielddefn)
    int     OGR_Fld_GetPrecision (void *fielddefn)
    int     OGR_Fld_GetType (void *fielddefn)
    int     OGR_Fld_GetWidth (void *fielddefn)
    void    OGR_Fld_Set (void *fielddefn, char *name, int fieldtype, int width, int precision, int justification)
    void    OGR_Fld_SetPrecision (void *fielddefn, int n)
    void    OGR_Fld_SetWidth (void *fielddefn, int n)
    OGRErr  OGR_G_AddGeometryDirectly (void *geometry, void *part)
    void    OGR_G_AddPoint (void *geometry, double x, double y, double z)
    void    OGR_G_AddPoint_2D (void *geometry, double x, double y)
    void    OGR_G_CloseRings (void *geometry)
    void *  OGR_G_CreateGeometry (int wkbtypecode)
    void    OGR_G_DestroyGeometry (void *geometry)
    unsigned char *  OGR_G_ExportToJson (void *geometry)
    void    OGR_G_ExportToWkb (void *geometry, int endianness, char *buffer)
    int     OGR_G_GetCoordinateDimension (void *geometry)
    int     OGR_G_GetGeometryCount (void *geometry)
    unsigned char *  OGR_G_GetGeometryName (void *geometry)
    int     OGR_G_GetGeometryType (void *geometry)
    void *  OGR_G_GetGeometryRef (void *geometry, int n)
    int     OGR_G_GetPointCount (void *geometry)
    double  OGR_G_GetX (void *geometry, int n)
    double  OGR_G_GetY (void *geometry, int n)
    double  OGR_G_GetZ (void *geometry, int n)
    void    OGR_G_ImportFromWkb (void *geometry, unsigned char *bytes, int nbytes)
    int     OGR_G_WkbSize (void *geometry)
    OGRErr  OGR_L_CreateFeature (void *layer, void *feature)
    int     OGR_L_CreateField (void *layer, void *fielddefn, int flexible)
    OGRErr  OGR_L_GetExtent (void *layer, void *extent, int force)
    void *  OGR_L_GetFeature (void *layer, int n)
    int     OGR_L_GetFeatureCount (void *layer, int m)
    void *  OGR_L_GetLayerDefn (void *layer)
    char *  OGR_L_GetName (void *layer)
    void *  OGR_L_GetNextFeature (void *layer)
    void *  OGR_L_GetSpatialFilter (void *layer)
    void *  OGR_L_GetSpatialRef (void *layer)
    void    OGR_L_ResetReading (void *layer)
    void    OGR_L_SetSpatialFilter (void *layer, void *geometry)
    void    OGR_L_SetSpatialFilterRect (
                void *layer, double minx, double miny, double maxx, double maxy
                )
    int     OGR_L_TestCapability (void *layer, char *name)
    void *  OGRGetDriverByName (char *)
    void *  OGROpen (char *path, int mode, void *x)
    void *  OGROpenShared (char *path, int mode, void *x)
    int     OGRReleaseDataSource (void *datasource)


